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

    if @event.attendances.present?
      @event.attendances.each do |attendance|
        attendance.confirmation_token = SecureRandom.urlsafe_base64
      end
    end

    if @event.save!
      render json: { status: "success", data: @event }, status: 201
    end
  end

  def update
    if @event.update!(event_params)
      render json: { status: "success", data: @event }
    end
  end

  def destroy
    event = Event.find_by(id: params[:id])

    if event
      begin
        if event.destroy!
          render json: { message: I18n.t("event.successful_destroyed") }, status: 204
        end
      end
    end
  end

  def activate_event
    begin
      if @event.activate
        head :no_content
      end
    end
  end

  def disable_event
    begin
      if @event.disable
        head :no_content
      end
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
    end
  end

  def get_all_event_dates_by_event
    @events = Event.find(params[:id])

    @event_dates_before_paginate = @events.event_dates.size
    @event_dates = @events.event_dates.then(&paginate)
    @page_no = page_no

    render(template: "events/index_event_dates", formats: :json)
  end

  def show_event_date_by_event
    begin
      @events = Event.find(params[:id])
      @event_date = @events.event_dates.find(params[:event_date_id])

      render(template: "events/show_event_date", formats: :json)
    end
  end

  private
    FILTER_PARAMS = [:name, :local, :city_id, :agenda_request_id, :user_id, :active, :date, :initial_date, :final_date,
                     :start_time, :end_time]

    def load_events
      @events = Event.filter(params.slice(*FILTER_PARAMS)).order("LOWER(name)")
    end

    def set_event
      begin
        @event = Event.find(params[:id])
      end
    end

    def generate_confirmation_token
      SecureRandom.urlsafe_base64(20)
    end

    def event_params
      params.require(:event)
            .permit(
              :name,
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
              ],
              event_dates_attributes: [
                :id,
                :event_id,
                :date,
                :start_time,
                :end_time
              ]
            )
    end
end
