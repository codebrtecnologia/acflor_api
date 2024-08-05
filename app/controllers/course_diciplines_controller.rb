class CourseDiciplinesController < ApplicationController
  before_action :set_course_dicipline, only: %i[ show update destroy ]

  # GET /course_diciplines.json
  def index
    load_course_diciplines

    @course_diciplines_before_paginate = @course_diciplines.size
    @course_diciplines = @course_diciplines.then(&paginate)
    @page_no = page_no
    render(template: "course_diciplines/index", formats: :json)
  end

  # GET /course_diciplines/1.json
  def show
    @course_diciplines = CourseDicipline.find(params[:id])
    render(template: "course_diciplines/show", formats: :json)
  end

  # POST /course_diciplines.json
  def create
    begin
      @course_dicipline = CourseDicipline.new(course_dicipline_params)

      if @course_dicipline.save!
        render json: { status: "success", data: @course_dicipline }, status: 201
      end
    end
  end

  # PATCH/PUT /course_diciplines/1.json
  def update
    begin
      if @course_dicipline.update!(course_dicipline_params)
        render json: { status: "success", data: @course_dicipline }
      end
    end
  end

  # DELETE /course_diciplines/1.json
  def destroy
    course_dicipline = CourseDicipline.find_by(id: params[:id])

    if course_dicipline
      begin
        if course_dicipline.destroy!
          render json: { message: I18n.t("course_dicipline.successful_destroyed") }, status: 204
        end
      end
    end
  end

  private

  FILTER_PARAMS = []

  def load_course_diciplines
    @course_diciplines = CourseDicipline.filter(params.slice(*FILTER_PARAMS))
  end

    def set_course_dicipline
      begin
        @course_dicipline = CourseDicipline.find(params[:id])
      rescue => e
        handle_exception(e, I18n.t("activerecord.models.course_dicipline"), params[:id])
      end
    end

    def course_dicipline_params
      params.require(:course_dicipline).permit(:course_id, :dicipline_id, :active)
    end
end
