class StudentsController < ApplicationController
  before_action :set_student, only: %i[ show update destroy ]

  # GET /students.json
  def index
    load_students

    @students_before_paginate = @students.size
    @students = @students.then(&paginate)
    @page_no = page_no
    render(template: "students/index", formats: :json)
  end

  # GET /students/1.json
  def show
    @students = Student.find(params[:id])
    render(template: "students/show", formats: :json)
  end

  # POST /students.json
  def create
    begin
      @student = Student.new(student_params)

      if @student.save!
        render json: { status: "success", data: @student }, status: 201
      end
    end
  end

  # PATCH/PUT /students/1.json
  def update
    begin
      if @student.update!(student_params)
        render json: { status: "success", data: @student }
      end
    end
  end

  # DELETE /students/1.json
  def destroy
    student = Student.find_by(id: params[:id])

    if student
      begin
        if student.destroy!
          render json: { message: I18n.t("student.successful_destroyed") }, status: 204
        end
      end
    end
  end

  private

  FILTER_PARAMS = []

  def load_students
    @students = Student.filter(params.slice(*FILTER_PARAMS))
  end

    def set_student
      begin
        @student = Student.find(params[:id])
      rescue => e
        handle_exception(e, I18n.t("activerecord.models.student"), params[:id])
      end
    end

    def student_params
      params.require(:student).permit(:course_preference_1_id, :course_preference_2_id, :user_id)
    end
end
