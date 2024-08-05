class TeachersController < ApplicationController
  before_action :set_teacher, only: %i[ show update destroy ]

  # GET /teachers.json
  def index
    load_teachers

    @teachers_before_paginate = @teachers.size
    @teachers = @teachers.then(&paginate)
    @page_no = page_no
    render(template: "teachers/index", formats: :json)
  end

  # GET /teachers/1.json
  def show
    @teachers = Teacher.find(params[:id])
    render(template: "teachers/show", formats: :json)
  end

  # POST /teachers.json
  def create
    begin
      @teacher = Teacher.new(teacher_params)

      if @teacher.save!
        render json: { status: "success", data: @teacher }, status: 201
      end
    end
  end

  # PATCH/PUT /teachers/1.json
  def update
    begin
      if @teacher.update!(teacher_params)
        render json: { status: "success", data: @teacher }
      end
    end
  end

  # DELETE /teachers/1.json
  def destroy
    teacher = Teacher.find_by(id: params[:id])

    if teacher
      begin
        if teacher.destroy!
          render json: { message: I18n.t("teacher.successful_destroyed") }, status: 204
        end
      end
    end
  end

  private

  FILTER_PARAMS = []

  def load_teachers
    @teachers = Teacher.filter(params.slice(*FILTER_PARAMS))
  end

    def set_teacher
      begin
        @teacher = Teacher.find(params[:id])
      rescue => e
        handle_exception(e, I18n.t("activerecord.models.teacher"), params[:id])
      end
    end

    def teacher_params
      params.require(:teacher).permit(:area_of_expertise, :teaching_experience, :professional_experience, :cnpj_mei, :deficiency_id, :user_id)
    end
end
