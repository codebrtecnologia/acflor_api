class AppointmentsController < ApplicationController
  before_action :set_appointment, only: %i[ show update destroy ]

  def index
    load_appointments

    @appointments_before_paginate = @appointments.size
    @appointments = @appointments.then(&paginate)
    @page_no = page_no
    render(template: "appointments/index", formats: :json)
  end

  def show
    @appointments = Appointment.find(params[:id])
    render(template: "appointments/show", formats: :json)
  end

  def create
    begin
      @appointment = Appointment.new(appointment_params)

      if @appointment.save!
        render json: { status: "success", data: @appointment }, status: 201
      end
    end
  end

  def update
    begin
      if @appointment.update!(appointment_params)
        render json: { status: "success", data: @appointment }
      end
    end
  end

  def destroy
    appointment = Appointment.find_by(id: params[:id])

    if appointment
      if appointment.destroy
        render json: { message: I18n.t("appointment.successful_destroyed") }, status: 204
      end
    end
  end

  def situations
    situation = Appointment.situations.map do |situation|
      { id: situation.last, name: I18n.t("enums.appointment.situation")[situation.first.to_sym] }
    end

    render json: { situation: situation.as_json }, status: 200
  end

  def repetitions
    repetition = Appointment.repetitions.map do |repetition|
      { id: repetition.last, name: I18n.t("enums.appointment.repetition")[repetition.first.to_sym] }
    end

    render json: { repetition: repetition.as_json }, status: 200
  end

  private

    FILTER_PARAMS = [:title, :local, :initial_date, :final_date, :situation, :repetition, :user_id,
                     :city_id, :person_id]

    def load_appointments
      @appointments = Appointment.filter(params.slice(*FILTER_PARAMS))
    end

    def set_appointment
      begin
        @appointment = Appointment.find(params[:id])
      end
    end

    def appointment_params
      params.require(:appointment)
            .permit(
              :title,
              :local,
              :initial_date,
              :final_date,
              :situation,
              :repetition,
              :observations,
              :user_id,
              :city_id,
              :person_id
            )
    end
end
