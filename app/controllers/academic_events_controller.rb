class AcademicEventsController < ApplicationController
  before_action :set_academic_event, only: %i[ show update destroy ]

  # GET /academic_events.json
  def index
    load_academic_events

    @academic_events_before_paginate = @academic_events.size
    @academic_events = @academic_events.then(&paginate)
    @page_no = page_no
    render(template: "academic_events/index", formats: :json)
  end

  # GET /academic_events/1.json
  def show
    @academic_events = AcademicEvent.find(params[:id])
    render(template: "academic_events/show", formats: :json)
  end

  # POST /academic_events.json
  def create
    begin
      @academic_event = AcademicEvent.new(academic_event_params)

      if @academic_event.save!
        render json: { status: "success", data: @academic_event }, status: 201
      end
    end
  end

  # PATCH/PUT /academic_events/1.json
  def update
    begin
      if @academic_event.update!(academic_event_params)
        render json: { status: "success", data: @academic_event }
      end
    end
  end

  # DELETE /academic_events/1.json
  def destroy
    academic_event = AcademicEvent.find_by(id: params[:id])

    if academic_event
      begin
        if academic_event.destroy!
          render json: { message: I18n.t("academic_event.successful_destroyed") }, status: 204
        end
      end
    end
  end

  private

  FILTER_PARAMS = []

  def load_academic_events
    @academic_events = AcademicEvent.filter(params.slice(*FILTER_PARAMS))
  end

    def set_academic_event
      begin
        @academic_event = AcademicEvent.find(params[:id])
      rescue => e
        handle_exception(e, I18n.t("activerecord.models.academic_event"), params[:id])
      end
    end

    def academic_event_params
      params.require(:academic_event).permit(:name, :description, :start_date, :end_date, :start_time, :end_time, :local)
    end
end
