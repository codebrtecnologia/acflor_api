class EntityCoursesController < ApplicationController
  before_action :set_entity_course, only: %i[ show update destroy ]

  # GET /entity_courses.json
  def index
    load_entity_courses

    @entity_courses_before_paginate = @entity_courses.size
    @entity_courses = @entity_courses.then(&paginate)
    @page_no = page_no
    render(template: "entity_courses/index", formats: :json)
  end

  # GET /entity_courses/1.json
  def show
    @entity_courses = EntityCourse.find(params[:id])
    render(template: "entity_courses/show", formats: :json)
  end

  # POST /entity_courses.json
  def create
    begin
      @entity_course = EntityCourse.new(entity_course_params)

      if @entity_course.save!
        render json: { status: "success", data: @entity_course }, status: 201
      end
    end
  end

  # PATCH/PUT /entity_courses/1.json
  def update
    begin
      if @entity_course.update!(entity_course_params)
        render json: { status: "success", data: @entity_course }
      end
    end
  end

  # DELETE /entity_courses/1.json
  def destroy
    entity_course = EntityCourse.find_by(id: params[:id])

    if entity_course
      begin
        if entity_course.destroy!
          render json: { message: I18n.t("entity_course.successful_destroyed") }, status: 204
        end
      end
    end
  end

    # Only allow a list of trusted parameters through.
  private

  FILTER_PARAMS = []

  def load_entity_courses
    @entity_courses = EntityCourse.filter(params.slice(*FILTER_PARAMS))
  end

    def set_entity_course
      begin
        @entity_course = EntityCourse.find(params[:id])
      rescue => e
        handle_exception(e, I18n.t("activerecord.models.entity_course"), params[:id])
      end
    end

    def entity_course_params
      params.require(:entity_course).permit(:entity_id, :course_id)
    end
end
