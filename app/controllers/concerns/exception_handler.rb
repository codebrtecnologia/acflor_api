module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from StandardError, with: :handle_internal_server_error
    rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :handle_unprocessable_entity
    rescue_from ActiveRecord::DeleteRestrictionError, with: :handle_delete_restriction_error
    rescue_from ActionController::RoutingError, with: :handle_action_controller_routing_error
    rescue_from ActionController::ParameterMissing, with: :handle_action_controller_parameter_missing
    # Adicionar outros tipos de exceções conforme necessário
  end

  private

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

  def handle_internal_server_error(exception)
    puts "EXCEPTION EXCEPTION ===> #{exception.inspect}"
    render_error(500, ProblemType::ERRO_DE_SISTEMA.uri, ProblemType::ERRO_DE_SISTEMA.title,
                 'Internal Server Error', exception.message)
  end

  def handle_not_found(exception)
    model_name = I18n.t("activerecord.models.#{exception.model.downcase}")
    id = exception.id

    message = "Não foi possível encontrar um registro de '#{model_name}' com ID '#{id}'"
    render_error(404, ProblemType::RECURSO_NAO_ENCONTRADO.uri, ProblemType::RECURSO_NAO_ENCONTRADO.title,
                 'Record Not Found', message)
  end

  def handle_unprocessable_entity(exception)
    error_fields = format_error_fields(exception.record.errors)

    render_error(422, ProblemType::DADOS_INVALIDOS.uri,ProblemType::DADOS_INVALIDOS.title,
                 'Unprocessable Entity', error_fields)
  end

  def handle_delete_restriction_error(exception)
    render_error(409, ProblemType::ENTIDADE_EM_USO.uri, ProblemType::ENTIDADE_EM_USO.title,
                 'Delete Restriction Error', "Registro não pode ser deletado devido a restrição de dependência com outra entidade")
  end

  def handle_action_controller_routing_error(exception)
    render_error(400, ProblemType::MENSAGEM_INCOMPREENSIVEL.uri, ProblemType::MENSAGEM_INCOMPREENSIVEL.title,
                 'Routing Error', "A rota informada não existe")
  end

  def handle_action_controller_parameter_missing(exception)
    render_error(400, ProblemType::MENSAGEM_INCOMPREENSIVEL.uri, ProblemType::MENSAGEM_INCOMPREENSIVEL.title,
                 'Parameter Missing', exception)
  end

  def render_error(status, type, title, error, message)
    render json: {
      status: status,
      type: type,
      title: title,
      error: error,
      message: message,
      timestamp: Time.now.iso8601
    }, status: status
  end

  def format_error_fields(errors)
    return [] unless errors&.any?
    model_name = errors.instance_variable_get(:@base).class.model_name.param_key
    error_fields = []

    errors.each do |error|
      attribute = error.attribute.to_s
      message = error.message
      error_fields << {
        name: I18n.t("activerecord.attributes.#{model_name}.#{attribute}"),
        message: message
      }
    end
    error_fields
  end

end
