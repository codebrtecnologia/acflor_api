class DiciplinesController < ApplicationController
  before_action :set_dicipline, only: %i[ show update destroy ]

  # GET /diciplines.json
  def index
    load_diciplines

    @diciplines_before_paginate = @diciplines.size
    @diciplines = @diciplines.then(&paginate)
    @page_no = page_no
    render(template: "diciplines/index", formats: :json)
  end

  # GET /diciplines/1.json
  def show
    @diciplines = Dicipline.find(params[:id])
    render(template: "diciplines/show", formats: :json)
  end

  # POST /diciplines.json
  def create
    begin
      @dicipline = Dicipline.new(dicipline_params)

      if @dicipline.save!
        render json: { status: "success", data: @dicipline }, status: 201
      end
    end
  end

  # PATCH/PUT /diciplines/1.json
  def update
    begin
      if @dicipline.update!(dicipline_params)
        render json: { status: "success", data: @dicipline }
      end
    end
  end

  # DELETE /diciplines/1.json
  def destroy
    dicipline = Dicipline.find_by(id: params[:id])

    if dicipline
      begin
        if dicipline.destroy!
          render json: { message: I18n.t("dicipline.successful_destroyed") }, status: 204
        end
      end
    end
  end

  private

  FILTER_PARAMS = []

  def load_diciplines
    @diciplines = Dicipline.filter(params.slice(*FILTER_PARAMS))
  end

  def set_dicipline
    begin
      @dicipline = Dicipline.find(params[:id])
    rescue => e
      handle_exception(e, I18n.t("activerecord.models.dicipline"), params[:id])
    end
  end

    def dicipline_params
      params.require(:dicipline).permit(:name, :code)
    end
end
