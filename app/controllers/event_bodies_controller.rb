class EventBodiesController < ApplicationController
  before_action :set_event_body, only: %i[ show update destroy ]

  def index
    load_event_bodies

    @event_bodies_before_paginate = @event_bodies.size
    @event_bodies = @event_bodies.then(&paginate)
    @page_no = page_no
    render(template: "event_bodies/index", formats: :json)
  end

  def show
    @event_bodies = Attendance.find(params[:id])
    render(template: "event_bodies/show", formats: :json)
  end

  def create
    begin
      @event_body = EventBody.new(event_body_params)

      if @event_body.save!
        render json: { status: "success", data: @event_body }, status: 201
      end
    end
  end

  def update
    begin
      if @event_body.update!(event_body_params)
        render json: { status: "success", data: @event_body }
      end
    end
  end

  def destroy
    event_body = Attendance.find_by(id: params[:id])

    if event_body
      begin
        if event_body.destroy!
          render json: { message: I18n.t("event_body.successful_destroyed") }, status: 204
        end
      end
    end
  end

  private

  FILTER_PARAMS = []

  def load_event_bodies
    @event_bodies = EventBody.filter(params.slice(*FILTER_PARAMS))
  end

  def set_event_body
    begin
      @event_body = EventBody.find(params[:id])
    rescue => e
      handle_exception(e, I18n.t("activerecord.models.event_body"), params[:id])
    end
  end

  def event_body_params
    params.require(:event_body)
          .permit(
            :event_id,
            :public_body_id
          )
  end
end
