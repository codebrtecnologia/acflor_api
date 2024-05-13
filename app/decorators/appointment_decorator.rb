class AppointmentDecorator < ApplicationDecorator
  delegate_all

  def situation_i18n
    if object.situation
      {
        id: object.class.situations[object.situation],
        name: I18n.t("enums.appointment.situation")[object.situation.to_sym]
      }
    end
  end

  def repetition_i18n
    if object.repetition
      {
        id: object.class.repetitions[object.repetition],
        name: I18n.t("enums.appointment.repetition")[object.repetition.to_sym]
      }
    end
  end

end
