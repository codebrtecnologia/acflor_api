module ApiException
  EXCEPTIONS = {
    # 400
    "ActiveRecord::RecordInvalid" => {
      status: 400,
      error_code: 40001,
      message: "Invalid request"
    },
    "BadRequest" => { status: 400, error_code: 40002, message: "Your own message in here" },

    # 401
    "Unauthorized" => { status: 401, error_code: 40101, message: "Your own message in here" },

    # 403
    "Forbidden" => { status: 403, error_code: 40301, message: "Your own message in here" },

    # 404
    "ActiveRecord::RecordNotFound" => { status: 404, error_code: 40401, message: "Registro não foi encontrado" },
    "NotFound" => { status: 404, error_code: 40402, message: "Registro não foi encontrado" },

    # Additional exceptions
    "ActionController::RoutingError" => { status: 404, error_code: 40403, message: "Route not found" },
    "AbstractController::ActionNotFound" => { status: 404, error_code: 40404, message: "Action not found" },
    "ActionController::MethodNotAllowed" => { status: 405, error_code: 40501, message: "Method not allowed" },
    "ActionController::UnknownHttpMethod" => { status: 405, error_code: 40502, message: "Unknown HTTP method" },
    "ActionController::NotImplemented" => { status: 501, error_code: 50101, message: "Not implemented" },
    "ActionController::UnknownFormat" => { status: 406, error_code: 40601, message: "Unknown format" },
    "ActionDispatch::Http::MimeNegotiation::InvalidType" => { status: 406, error_code: 40602, message: "Invalid MIME type" },
    "ActionController::MissingExactTemplate" => { status: 406, error_code: 40603, message: "Missing exact template" },
    "ActionController::InvalidAuthenticityToken" => { status: 422, error_code: 42201, message: "Invalid authenticity token" },
    "ActionController::InvalidCrossOriginRequest" => { status: 422, error_code: 42202, message: "Invalid cross-origin request" },
    "ActionDispatch::Http::Parameters::ParseError" => { status: 400, error_code: 40003, message: "Parameter parsing error" },
    "ActionController::ParameterMissing" => { status: 400, error_code: 40004, message: "Parameter missing" },
    "Rack::QueryParser::ParameterTypeError" => { status: 400, error_code: 40005, message: "Parameter type error" },
    "Rack::QueryParser::InvalidParameterError" => { status: 400, error_code: 40006, message: "Invalid parameter" },
    "ActiveRecord::StaleObjectError" => { status: 409, error_code: 40901, message: "Stale object error" },
    "ActiveRecord::RecordNotSaved" => { status: 422, error_code: 42203, message: "Record not saved" }
  }

  class BaseError < StandardError
    def initialize(msg = nil)
      @message = msg
    end

    def message
      @message || nil
    end
  end

  module Handler
    def self.included(klass)
      klass.class_eval do
        EXCEPTIONS.each do |exception_name, context|
          unless ApiException.const_defined?(exception_name)
            ApiException.const_set(exception_name, Class.new(BaseError))
            exception_name = "ApiException::#{exception_name}"
          end
          puts "EXCEPTION  SAINDO DO PRIMEIRO BLOCO ===>.... #{exception_name}"
          rescue_from exception_name do |exception|
            render status: context[:status], json: { error_code: context[:error_code], message: context[:message],
                                                     detail: (exception.message) }.compact
          end
        end
      end
    end
  end
end