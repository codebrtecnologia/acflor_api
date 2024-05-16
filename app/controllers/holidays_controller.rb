class HolidaysController < ApplicationController
  before_action :set_holiday, only: %i[ show update destroy ]

  def index
    load_holidays

    @holidays_before_paginate = @holidays.size
    @holidays = @holidays.then(&paginate)
    @page_no = page_no
    render(template: "holidays/index", formats: :json)
  end

  def show
    @holidays = Holiday.find(params[:id])
    render(template: "holidays/show", formats: :json)
  end

  def create
    begin
      @holiday = Holiday.new(holiday_params)

      if @holiday.save!
        render json: { status: "success", data: @holiday }, status: 201
      else
        render json: handle_unprocessable_entity(@holiday.errors), status: :unprocessable_entity
      end
    rescue => e
      handle_exception(e)
    end
  end

  def update
    begin
      if @holiday.update!(holiday_params)
        render json: { status: "success", data: @holiday }
      end
    end
  end

  def destroy
    holiday = Holiday.find_by(id: params[:id])

    if holiday
      begin
        if holiday.destroy!
          render json: { message: I18n.t("holiday.successful_destroyed") }, status: 204
        end
      end
    end
  end

  def holiday_types
    holiday_type = Holiday.holiday_types.map do |holiday_type|
      { id: holiday_type.last, name: I18n.t("enums.holiday.holiday_type")[holiday_type.first.to_sym] }
    end

    render json: { holiday_type: holiday_type.as_json }, status: 200
  end

  private

    FILTER_PARAMS = [:description, :initial_date, :final_date, :holiday_type]

    def load_holidays
      @holidays = Holiday.filter(params.slice(*FILTER_PARAMS)).order("LOWER(description)")
    end

    def set_holiday
      begin
        @holiday = Holiday.find(params[:id])
      rescue => e
        handle_exception(e, I18n.t("activerecord.models.holiday"), params[:id])
      end
    end

    def holiday_params
      params.require(:holiday)
            .permit(
              :description,
              :date,
              :holiday_type
            )
    end
end
