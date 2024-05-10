module Errors
    extend ActiveSupport::Concern
  
    class ProblemType
      attr_reader :uri, :title
  
      def initialize(path, title)
        @uri = "https://sistemas.casacivil.ce.gov.br/ipe#{path}"
        @title = title
      end
  
      MENSAGEM_INCOMPREENSIVEL = new("/mensagem-incompreensivel", "Mensagem incompreensível")
      RECURSO_NAO_ENCONTRADO = new("/recurso-nao-encontrado", "Recurso não encontrado")
      ENTIDADE_EM_USO = new("/entidade-em-uso", "Entidade em uso")
      ERRO_NEGOCIO = new("/erro-negocio", "Violação de regra de negócio")
      PARAMETRO_INVALIDO = new("/parametro-invalido", "Parâmetro Inválido")
      ERRO_DE_SISTEMA = new("/erro-de-sistema", "Erro de Sistema")
      DADOS_INVALIDOS = new("/dados-invalidos", "Dados inválidos")
    end
  
    #CONSTANTS
    MSG_DADOS_INVALIDOS = "Um ou mais campos estão inválidos. Faça o preenchimento correto e tente novamente."
    MSG_ENTIDADE_EM_USO = "Recurso não pode ser deletado pois está em uso."
    MSG_ERRO_GENERICA_USUARIO_FINAL = "Ocorreu um erro interno inesperado no sistema. Tente novamente e se o problema persistir, entre em contato com o administrador do sistema."
    MSG_MENSAGEM_INCOMPREENSIVEL = "O corpo da requisição está inválido. Verifique erro de sintaxe."

    # TRATA EXCECAO GERAL
    def handle_exception(exception, resource = nil, id = nil, errors = [])
      puts "EXCEPTION ==> #{exception}"
      case exception
      when ActionController::ParameterMissing
        render json: handle_parameter_missing_exception, status: :bad_request
      when ActiveRecord::RecordNotFound
        render json: handle_resource_not_found(e: exception), status: :not_found
      when ActiveRecord::DeleteRestrictionError
        render json: handle_deletion_restriction, status: :conflict
      else
        render json: handle_generic_error, status: :internal_server_error
      end
    end

    # EXCECOES ESPECIFICAS
    def handle_unprocessable_entity(errors)
      {
        status: 422,
        type: ProblemType::DADOS_INVALIDOS.uri,
        title: ProblemType::DADOS_INVALIDOS.title,
        detail: MSG_DADOS_INVALIDOS,
        userMessage: MSG_DADOS_INVALIDOS,
        timestamp: Time.now.iso8601,
        fields: format_error_fields(errors)
      }
    end

    def handle_parameter_missing_exception
      {
        status: 400,
        type: ProblemType::DADOS_INVALIDOS.uri,
        title: ProblemType::DADOS_INVALIDOS.title,
        detail: MSG_DADOS_INVALIDOS,
        userMessage: MSG_DADOS_INVALIDOS,
        timestamp: Time.now.iso8601
      }
    end

    def handle_resource_not_found(exception)
      resource_name = I18n.t("activerecord.models.#{exception.model.downcase}")
      resource_id = exception.id

      render json: {
        status: 404,
        type: ProblemType::RECURSO_NAO_ENCONTRADO.uri,
        title: ProblemType::RECURSO_NAO_ENCONTRADO.title,
        detail: "Não foi encontrado um recurso '#{resource_name}' com o código #{resource_id}",
        userMessage: "Não foi encontrado um #{resource_name} com o código #{resource_id}",
        timestamp: Time.now.iso8601
      }, status: 404
    end
  
    def handle_deletion_restriction
      {
        status: 409,
        type: ProblemType::ENTIDADE_EM_USO.uri,
        title: ProblemType::ENTIDADE_EM_USO.title,
        detail: MSG_ENTIDADE_EM_USO,
        userMessage: MSG_ENTIDADE_EM_USO,
        timestamp: Time.now.iso8601
      }
    end
  
    def handle_bad_request
      {
        status: 400,
        type: ProblemType::MENSAGEM_INCOMPREENSIVEL.uri,
        title: ProblemType::MENSAGEM_INCOMPREENSIVEL.title,
        detail: MSG_MENSAGEM_INCOMPREENSIVEL,
        userMessage: MSG_MENSAGEM_INCOMPREENSIVEL,
        timestamp: Time.now.iso8601
      }
    end

    def handle_generic_error
      {
        status: 500,
        type: ProblemType::ERRO_DE_SISTEMA.uri,
        title: ProblemType::ERRO_DE_SISTEMA.title,
        detail: MSG_ERRO_GENERICA_USUARIO_FINAL,
        userMessage: MSG_ERRO_GENERICA_USUARIO_FINAL,
        timestamp: Time.now.iso8601
      }
    end

    private

    def format_error_fields(errors)
      return [] unless errors&.any?

      model_name = errors.instance_variable_get(:@base).class.model_name.param_key
      error_fields = []

      errors.each do |error|
        attribute = error.attribute.to_s
        message = error.message
        error_fields << {
          name: I18n.t("activerecord.attributes.#{model_name}.#{attribute}"),
          userMessage: message
        }
      end
      error_fields
    end
  end