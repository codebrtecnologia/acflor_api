class HolidayDecorator < ApplicationDecorator
  delegate_all
  def holiday_type_i18n
    if object.holiday_type
      {
        id: object.class.holiday_types[object.holiday_type],
        name: I18n.t("enums.holiday.holiday_type")[object.holiday_type.to_sym]
      }
    end
  end

end
