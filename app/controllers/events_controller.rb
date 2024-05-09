class EventsController < ApplicationController
  before_action :set_event, only: %i[ show update destroy activate_event disable_event]

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
    begin
      @event = Event.new(event_params)

      if @event.save
        associate_people_with_event(@event, params[:people_params])
        render json: { status: "success", data: @event }, status: 201
      else
        render json: handle_unprocessable_entity(@event.errors), status: :unprocessable_entity
      end
    rescue => e
      handle_exception(e)
    end
  end

  def update
    begin
      if @event.update(event_params)
        render json: { status: "success", data: @event }
      else
        render json: handle_unprocessable_entity(@event.errors), status: :unprocessable_entity
      end
    rescue => e
      handle_exception(e)
    end
  end

  def destroy
    event = Holiday.find_by(id: params[:id])

    if event
      begin
        if event.destroy
          render json: { message: I18n.t("event.successful_destroyed") }, status: 204
        end
      rescue => e
        handle_exception(e)
      end
    end
  end

  def activate_event
    begin
      if @event.activate
        head :no_content
      else
        render json: handle_unprocessable_entity(@event.errors), status: :unprocessable_entity
      end
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
              :people_params
            )
    end

    def associate_people_with_event(event, people_params)
      return if people_params.blank?

      people_params.each do |person_params|
        person_id = person_params[:id]
        person = Person.find(person_id)
        Attendance.create(event: event, person: person, role: person_params[:role],
                          observations: person_params[:observations])
      end
    end
end
