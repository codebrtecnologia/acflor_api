module IdValidation
  extend ActiveSupport::Concern

  class_methods do
    #CONSTANT
    MSG_INVALID_ID = "ID informado não é válido"

    def validate_id(attribute)
      validate do
        value = send(attribute)
        errors.add(attribute, MSG_INVALID_ID) if value.present? && !self.class.exists?(value)
      end
    end
  end
end

