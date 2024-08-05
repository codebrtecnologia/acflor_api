class TeamsController < ApplicationController
  before_action :set_team, only: %i[ show update destroy ]

  # GET /teams.json
  def index
    load_teams

    @teams_before_paginate = @teams.size
    @teams = @teams.then(&paginate)
    @page_no = page_no
    render(template: "teams/index", formats: :json)
  end

  # GET /teams/1.json
  def show
    @teams = Team.find(params[:id])
    render(template: "teams/show", formats: :json)
  end

  # POST /teams.json
  def create
    begin
      @team = Team.new(team_params)

      if @team.save!
        render json: { status: "success", data: @team }, status: 201
      end
    end
  end

  # PATCH/PUT /teams/1.json
  def update
    begin
      if @team.update!(team_params)
        render json: { status: "success", data: @team }
      end
    end
  end

  # DELETE /teams/1.json
  def destroy
    team = Team.find_by(id: params[:id])

    if team
      begin
        if team.destroy!
          render json: { message: I18n.t("team.successful_destroyed") }, status: 204
        end
      end
    end
  end

  private

  FILTER_PARAMS = []

  def load_teams
    @teams = Team.filter(params.slice(*FILTER_PARAMS))
  end

    def set_team
      begin
        @team = Team.find(params[:id])
      rescue => e
        handle_exception(e, I18n.t("activerecord.models.team"), params[:id])
      end
    end

    # Only allow a list of trusted parameters through.
    def team_params
      params.require(:team).permit(:code, :start, :closing, :active, :course_id, :teacher_id)
    end
end
