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

      if @attendance.save
        render json: { status: "success", data: @attendance }, status: 201
      else
        render json: handle_unprocessable_entity(@attendance.errors), status: :unprocessable_entity
      end
    rescue => e
      handle_exception(e)
    end
  end

  def update
    begin
      if @attendance.update(attendance_params)
        render json: { status: "success", data: @attendance }
      else
        render json: handle_unprocessable_entity(@attendance.errors), status: :unprocessable_entity
      end
    rescue => e
      handle_exception(e)
    end
  end

  def destroy
    attendance = Attendance.find_by(id: params[:id])

    if attendance
      begin
        if attendance.destroy
          render json: { message: I18n.t("attendance.successful_destroyed") }, status: 204
        end
      rescue => e
        handle_exception(e)
      end
    end
  end

  private

  FILTER_PARAMS = [:event_id, :person_id, :confirmed_presence, :attended_the_event, :role]

  def load_attendances
    @attendances = Attendance.filter(params.slice(*FILTER_PARAMS))
  end

  def set_attendance
    begin
      @attendance = Holiday.find(params[:id])
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
            :observations
          )
  end
end
