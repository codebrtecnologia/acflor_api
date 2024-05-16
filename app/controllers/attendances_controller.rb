class AttendancesController < ApplicationController
  before_action :set_attendance, only: %i[ show update destroy ]

  def index
    load_attendances

    @attendances_before_paginate = @attendances.size
    @attendances = @attendances.then(&paginate)
    @page_no = page_no
    render(template: "attendances/index", formats: :json)
  end

  def show
    @attendances = Attendance.find(params[:id])
    render(template: "attendances/show", formats: :json)
  end

  def create
    begin
      @attendance = Attendance.new(attendance_params)

      if @attendance.save!
        # @attendance.update(confirmation_token: generate_confirmation_token)
        render json: { status: "success", data: @attendance }, status: 201
      end
    end
  end

  def update
    begin
      if @attendance.update!(attendance_params)
        render json: { status: "success", data: @attendance }
      end
    end
  end

  def destroy
    attendance = Attendance.find_by(id: params[:id])

    if attendance
      begin
        if attendance.destroy
          render json: { message: I18n.t("attendance.successful_destroyed") }, status: 204
        end
      end
    end
  end

  def notify_for_event
    begin
      event = Event.find(params[:event_id])
      if event.present?

        attendances = Attendance.includes(:person).where(event_id: event.id, confirmed_presence: false)
        if attendances.present?
          attendances.each do |attendance|
            AttendanceMailer.attendance_email(attendance.person, event, current_user).deliver_later
          end
          render json: { message: 'Email(s) enviado(s) com sucesso!' }, status: :ok
        else
          render json: { message: 'Todos os participantes desse evento já confirmaram presença!' }, status: :bad_request
        end
      end
    end
  end

  def confirm
    attendance = Attendance.find_by(confirmation_token: params[:token])

    if attendance
      if attendance.confirmed_presence == true && attendance.confirmation_date != nil
        render json: { status: 'error', message: 'Presença já confirmada.' }, status: :unprocessable_entity
      elsif !attendance.confirmed_presence && attendance.confirmation_token_expires_at && attendance.confirmation_token_expires_at > Time.zone.now
        attendance.update(confirmed_presence: true, confirmation_date: Time.zone.now)
        render json: { status: 'success', message: 'Presença confirmada com sucesso.' }
      else
        render json: { status: 'error', message: 'Token inválido ou expirado.' }, status: :unprocessable_entity
      end
    else
      render json: { error: "Token Inválido" }, status: :not_found
    end
  end

  private

  FILTER_PARAMS = [:event_id, :person_id, :confirmed_presence, :attended_the_event, :role]

  def generate_confirmation_token
    SecureRandom.urlsafe_base64(20)
  end

  def load_attendances
    @attendances = Attendance.filter(params.slice(*FILTER_PARAMS))
  end

  def set_attendance
    begin
      @attendance = Attendance.find(params[:id])
    rescue => e
      handle_exception(e, I18n.t("activerecord.models.attendance"), params[:id])
    end
  end

  def attendance_params
    params.require(:attendance)
          .permit(
            :event_id,
            :person_id,
            :confirmed_presence,
            :confirmation_date,
            :attended_the_event,
            :role,
            :observations,
            :confirmation_token
          )
  end
end
