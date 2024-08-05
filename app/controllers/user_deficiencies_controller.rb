class UserDeficienciesController < ApplicationController
  before_action :set_user_deficiency, only: %i[ show update destroy ]

  # GET /user_deficiencies.json
  def index
    load_user_deficiencies

    @user_deficiencies_before_paginate = @user_deficiencies.size
    @user_deficiencies = @user_deficiencies.then(&paginate)
    @page_no = page_no
    render(template: "user_deficiencies/index", formats: :json)
  end

  # GET /user_deficiencies/1.json
  def show
    @user_deficiencies = UserDeficiency.find(params[:id])
    render(template: "user_deficiencies/show", formats: :json)
  end

  # POST /user_deficiencies.json
  def create
    begin
      @user_deficiency = UserDeficiency.new(user_deficiency_params)

      if @user_deficiency.save!
        render json: { status: "success", data: @user_deficiency }, status: 201
      end
    end
  end

  # PATCH/PUT /user_deficiencies/1.json
  def update
    begin
      if @user_deficiency.update!(user_deficiency_params)
        render json: { status: "success", data: @user_deficiency }
      end
    end
  end

  # DELETE /user_deficiencies/1.json
  def destroy
    user_deficiency = UserDeficiency.find_by(id: params[:id])

    if user_deficiency
      begin
        if user_deficiency.destroy!
          render json: { message: I18n.t("user_deficiency.successful_destroyed") }, status: 204
        end
      end
    end
  end

  private

  FILTER_PARAMS = []

  def load_user_deficiencies
    @user_deficiencies = UserDeficiency.filter(params.slice(*FILTER_PARAMS))
  end

    def set_user_deficiency
      begin
        @user_deficiency = UserDeficiency.find(params[:id])
      rescue => e
        handle_exception(e, I18n.t("activerecord.models.user_deficiency"), params[:id])
      end
    end

    # Only allow a list of trusted parameters through.
    def user_deficiency_params
      params.require(:user_deficiency).permit(:user_id, :deficiency_id, :observations)
    end
end
