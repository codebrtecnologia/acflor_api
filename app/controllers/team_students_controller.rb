class TeamStudentsController < ApplicationController
  before_action :set_team_student, only: %i[ show update destroy ]

  # GET /team_students.json
  def index
    load_team_students

    @team_students_before_paginate = @team_students.size
    @team_students = @team_students.then(&paginate)
    @page_no = page_no
    render(template: "team_students/index", formats: :json)
  end

  # GET /team_students/1.json
  def show
    @team_students = TeamStudent.find(params[:id])
    render(template: "team_students/show", formats: :json)
  end

  # POST /team_students.json
  def create
    begin
      @team_student = TeamStudent.new(team_student_params)

      if @team_student.save!
        render json: { status: "success", data: @team_student }, status: 201
      end
    end
  end

  # PATCH/PUT /team_students/1.json
  def update
    begin
      if @team_student.update!(team_student_params)
        render json: { status: "success", data: @team_student }
      end
    end
  end

  # DELETE /team_students/1.json
  def destroy
    team_student = TeamStudent.find_by(id: params[:id])

    if team_student
      begin
        if team_student.destroy!
          render json: { message: I18n.t("team_student.successful_destroyed") }, status: 204
        end
      end
    end
  end

  private

  FILTER_PARAMS = []

  def load_team_students
    @team_students = TeamStudent.filter(params.slice(*FILTER_PARAMS))
  end

    def set_team_student
      begin
        @team_student = TeamStudent.find(params[:id])
      rescue => e
        handle_exception(e, I18n.t("activerecord.models.team_student"), params[:id])
      end
    end

    # Only allow a list of trusted parameters through.
    def team_student_params
      params.require(:team_student).permit(:student_id, :team_id, :registration_number)
    end
end
