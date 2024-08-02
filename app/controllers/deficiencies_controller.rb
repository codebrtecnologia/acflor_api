class DeficienciesController < ApplicationController
  before_action :set_deficiency, only: %i[ show update destroy ]

  # GET /deficiencies.json
  def index
    load_deficiencies

    @deficiencies_before_paginate = @deficiencies.size
    @deficiencies = @deficiencies.then(&paginate)
    @page_no = page_no
    render(template: "deficiencies/index", formats: :json)
  end

  # GET /deficiencies/1.json
  def show
    @deficiencies = Deficiency.find(params[:id])
    render(template: "deficiencies/show", formats: :json)
  end

  # POST /deficiencies.json
  def create
    begin
      @deficiency = Deficiency.new(deficiency_params)

      if @deficiency.save!
        render json: { status: "success", data: @deficiency }, status: 201
      end
    end
  end

  # PATCH/PUT /deficiencies/1.json
  def update
    begin
      if @deficiency.update!(deficiency_params)
        render json: { status: "success", data: @deficiency }
      end
    end
  end

  # DELETE /deficiencies/1.json
  def destroy
    deficiency = Deficiency.find_by(id: params[:id])

    if deficiency
      begin
        if deficiency.destroy!
          render json: { message: I18n.t("deficiency.successful_destroyed") }, status: 204
        end
      end
    end
  end

  private

  FILTER_PARAMS = []

  def load_deficiencies
    @deficiencies = Deficiency.filter(params.slice(*FILTER_PARAMS))
  end

  def set_deficiency
    begin
      @deficiency = Deficiency.find(params[:id])
    rescue => e
      handle_exception(e, I18n.t("activerecord.models.deficiency"), params[:id])
    end
  end

    def deficiency_params
      params.require(:deficiency).permit(:name)
    end
end
