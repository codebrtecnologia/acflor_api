class EventDatesController < ApplicationController
  before_action :set_event_date, only: %i[ show update destroy ]

  def index
    load_event_dates

    @event_dates_before_paginate = @event_dates.size
    @event_dates = @event_dates.then(&paginate)
    @page_no = page_no
    render(template: "event_dates/index", formats: :json)
  end

  def show
    @event_dates = EventDate.find(params[:id])
    render(template: "event_dates/show", formats: :json)
  end

  def create
    begin
      @event_date = EventDate.new(event_date_params)

      if @event_date.save!
        render json: { status: "success", data: @event_date }, status: 201
      end
    end
  end

  def update
    begin
      if @event_date.update!(event_date_params)
        render json: { status: "success", data: @event_date }
      end
    end
  end

  def destroy
    event_date = EventDate.find_by(id: params[:id])

    if event_date
      begin
        if event_date.destroy!
          render json: { message: I18n.t("event_date.successful_destroyed") }, status: 204
        end
      end
    end
  end

  private

  FILTER_PARAMS = []

  def load_event_dates
    @event_dates = EventDate.filter(params.slice(*FILTER_PARAMS))
  end

  def set_event_date
    begin
      @event_date = EventDate.find(params[:id])
    rescue => e
      handle_exception(e, I18n.t("activerecord.models.event_date"), params[:id])
    end
  end

  def event_date_params
    params.require(:event_date)
          .permit(
            :event_id,
            :public_date_id
          )
  end
end
