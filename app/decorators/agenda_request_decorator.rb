class AgendaRequestDecorator < ApplicationDecorator
  delegate_all

  def agenda_request_status_i18n
    if object.agenda_request_status
      {
        id: object.class.agenda_request_statuses[object.agenda_request_status],
        name: I18n.t("enums.agenda_request.agenda_request_status")[object.agenda_request_status.to_sym]
      }
    end
  end

end
