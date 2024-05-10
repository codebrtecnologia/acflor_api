class EventsController < ApplicationController
  before_action :set_event, only: %i[ show update destroy activate_event disable_event get_all_attendances_by_event]

  def index
    load_events

    @events_before_paginate = @events.size
    @events = @events.then(&paginate)
    @page_no = page_no
    render(template: "events/index", formats: :json)
  end

  def show
    @events = Event.find(params[:id])
    render(template: "events/show", formats: :json)
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      render json: { status: "success", data: @event }, status: 201
    end
  end

  def update
    if @event.update(event_params)
      render json: { status: "success", data: @event }
    end
  end

  def destroy
    begin
      @events = Event.find(params[:id])

      if @events.destroy
        render json: { message: I18n.t("event.successful_destroyed") }, status: 204
      end
    rescue ActiveRecord::RecordNotFound => e
      handle_resource_not_found(e)
    rescue => e
      handle_exception(e)
    end
  end

  def activate_event
    begin
      if @event.activate
        head :no_content
      else
        render json: handle_unprocessable_entity(@event.errors), status: :unprocessable_entity
      end
    rescue ActiveRecord::RecordNotFound => e
      handle_resource_not_found(e)
    rescue => e
      handle_exception(e)
    end
  end

  def disable_event
    begin
      if @event.disable
        head :no_content
      else
        render json: handle_unprocessable_entity(@event.errors), status: :unprocessable_entity
      end
    rescue ActiveRecord::RecordNotFound => e
      handle_resource_not_found(e)
    rescue => e
      handle_exception(e)
    end
  end

  def get_all_attendances_by_event
    @events = Event.find(params[:id])

    @events_attendances_before_paginate = @events.attendances.size
    @events_attendances = @events.attendances.then(&paginate)
    @page_no = page_no

    render(template: "events/index_events_attendances", formats: :json)
  end

  def show_attendance_by_event
    begin
      @events = Event.find(params[:id])
      @events_attendance = @events.attendances.find(params[:attendance_id])

      render(template: "events/show_events_attendance", formats: :json)
    rescue ActiveRecord::RecordNotFound => e
      handle_resource_not_found(e)
    rescue => e
      handle_exception(e)
    end
  end

  def get_all_event_bodies_by_event
    @events = Event.find(params[:id])

    @event_bodies_before_paginate = @events.event_bodies.size
    @event_bodies = @events.event_bodies.then(&paginate)
    @page_no = page_no

    render(template: "events/index_event_bodies", formats: :json)
  end

  def show_event_body_by_event
    begin
      @events = Event.find(params[:id])
      @event_body = @events.event_bodies.find(params[:event_body_id])

      render(template: "events/show_event_body", formats: :json)
    rescue ActiveRecord::RecordNotFound => e
      handle_resource_not_found(e)
    rescue => e
      handle_exception(e)
    end
  end

  private
    FILTER_PARAMS = [:name, :initial_date, :final_date, :local,
                     :city_id, :agenda_request_id, :user_id, :active]

    def load_events
      @events = Event.filter(params.slice(*FILTER_PARAMS)).order("LOWER(name)")
    end

    def set_event
      begin
        @event = Event.find(params[:id])
      rescue => e
        handle_exception(e, I18n.t("activerecord.models.event"), params[:id])
      end
    end

    def event_params
      params.require(:event)
            .permit(
              :name,
              :initial_date,
              :final_date,
              :observations,
              :infos,
              :local,
              :city_id,
              :agenda_request_id,
              :user_id,
              :active,
              attendances_attributes: [
                :id,
                :event_id,
                :person_id,
                :confirmed_presence,
                :confirmation_date,
                :attended_the_event,
                :role,
                :observations
              ],
              event_bodies_attributes: [
                :id,
                :event_id,
                :public_body_id
              ]
            )
    end
end
