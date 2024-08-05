class ClassesController < ApplicationController
  before_action :set_classe, only: %i[ show update destroy ]

  # GET /classes.json
  def index
    load_classes

    @classes_before_paginate = @classes.size
    @classes = @classes.then(&paginate)
    @page_no = page_no
    render(template: "classes/index", formats: :json)
  end

  # GET /classes/1.json
  def show
    @classes = Classe.find(params[:id])
    render(template: "classes/show", formats: :json)
  end

  # POST /classes.json
  def create
    begin
      @classe = Classe.new(classe_params)

      if @classe.save!
        render json: { status: "success", data: @classe }, status: 201
      end
    end
  end

  # PATCH/PUT /classes/1.json
  def update
    begin
      if @classe.update!(classe_params)
        render json: { status: "success", data: @classe }
      end
    end
  end

  # DELETE /classes/1.json
  def destroy
    classe = Classe.find_by(id: params[:id])

    if classe
      begin
        if classe.destroy!
          render json: { message: I18n.t("classe.successful_destroyed") }, status: 204
        end
      end
    end
  end

  private

  FILTER_PARAMS = []

  def load_classes
    @classes = Classe.filter(params.slice(*FILTER_PARAMS))
  end

    def set_classe
      begin
        @classe = Classe.find(params[:id])
      rescue => e
        handle_exception(e, I18n.t("activerecord.models.classe"), params[:id])
      end
    end

    # Only allow a list of trusted parameters through.
    def classe_params
      params.require(:classe).permit(:name, :date, :shift, :description, :start_time, :end_time, :team_id, :teacher_id)
    end
end
