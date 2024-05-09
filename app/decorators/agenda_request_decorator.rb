class AgendaRequestDecorator < ApplicationDecorator
  delegate_all

  def status_i18n
    if object.status
      {
        id: object.class.statuses[object.status],
        name: I18n.t("enums.agenda_request.status")[object.status.to_sym]
      }
    end
  end

end
