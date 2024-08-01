class CoursesController < ApplicationController
  before_action :set_course, only: %i[ show update destroy ]

  # GET /courses.json
  def index
    load_courses

    @courses_before_paginate = @courses.size
    @courses = @courses.then(&paginate)
    @page_no = page_no
    render(template: "courses/index", formats: :json)
  end

  # GET /courses/1.json
  def show
    @courses = Course.find(params[:id])
    render(template: "courses/show", formats: :json)
  end

  # POST /courses.json
  def create
    begin
      @course = Course.new(course_params)

      if @course.save!
        render json: { status: "success", data: @course }, status: 201
      end
    end
  end

  # PATCH/PUT /courses/1.json
  def update
    begin
      if @course.update!(course_params)
        render json: { status: "success", data: @course }
      end
    end
  end

  # DELETE /courses/1.json
  def destroy
    course = Course.find_by(id: params[:id])

    if course
      begin
        if course.destroy!
          render json: { message: I18n.t("course.successful_destroyed") }, status: 204
        end
      end
    end
  end

  private

  FILTER_PARAMS = []

  def load_courses
    @courses = Course.filter(params.slice(*FILTER_PARAMS))
  end

    def set_course
      begin
        @course = Course.find(params[:id])
      rescue => e
        handle_exception(e, I18n.t("activerecord.models.course"), params[:id])
      end
    end

    def course_params
      params.require(:course).permit(:name)
    end
end
