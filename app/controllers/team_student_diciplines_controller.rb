class TeamStudentDiciplinesController < ApplicationController
  before_action :set_team_student_dicipline, only: %i[ show update destroy ]

  # GET /courses.json
  def index
    load_team_student_diciplines

    @team_student_diciplines_before_paginate = @team_student_diciplines.size
    @team_student_diciplines = @team_student_diciplines.then(&paginate)
    @page_no = page_no
    render(template: "team_student_diciplines/index", formats: :json)
  end

  # GET /team_student_diciplines/1.json
  def show
    @team_student_diciplines = TeamStudentDicipline.find(params[:id])
    render(template: "team_student_diciplines/show", formats: :json)
  end

  # POST /team_student_diciplines.json
  def create
    begin
      @team_student_dicipline = TeamStudentDicipline.new(team_student_dicipline_params)

      if @team_student_dicipline.save!
        render json: { status: "success", data: @team_student_dicipline }, status: 201
      end
    end
  end

  # PATCH/PUT /team_student_diciplines/1.json
  def update
    begin
      if @team_student_dicipline.update!(team_student_dicipline_params)
        render json: { status: "success", data: @team_student_dicipline }
      end
    end
  end

  # DELETE /team_student_diciplines/1.json
  def destroy
    team_student_dicipline = TeamStudentDicipline.find_by(id: params[:id])

    if team_student_dicipline
      begin
        if team_student_dicipline.destroy!
          render json: { message: I18n.t("team_student_dicipline.successful_destroyed") }, status: 204
        end
      end
    end
  end

  private

  FILTER_PARAMS = []

  def load_team_student_diciplines
    @team_student_diciplines = TeamStudentDicipline.filter(params.slice(*FILTER_PARAMS))
  end

    def set_team_student_dicipline
      begin
        @team_student_dicipline = TeamStudentDicipline.find(params[:id])
      rescue => e
        handle_exception(e, I18n.t("activerecord.models.team_student_dicipline"), params[:id])
      end
    end

    def team_student_dicipline_params
      params.require(:team_student_dicipline).permit(:team_student_id, :dicipline_id, :dicipline_status_id, :active)
    end
end
