class DiciplineStatusesController < ApplicationController
  before_action :set_dicipline_status, only: %i[ show update destroy ]

  # GET /courses.json
  def index
    load_dicipline_statuses

    @dicipline_statuses_before_paginate = @dicipline_statuses.size
    @dicipline_statuses = @dicipline_statuses.then(&paginate)
    @page_no = page_no
    render(template: "dicipline_statuses/index", formats: :json)
  end

  # GET /dicipline_statuses/1.json
  def show
    @dicipline_statuses = DiciplineStatus.find(params[:id])
    render(template: "dicipline_statuses/show", formats: :json)
  end

  # POST /dicipline_statuses.json
  def create
    begin
      @dicipline_status = DiciplineStatus.new(dicipline_status_params)

      if @dicipline_status.save!
        render json: { status: "success", data: @dicipline_status }, status: 201
      end
    end
  end

  # PATCH/PUT /dicipline_statuses/1.json
  def update
    begin
      if @dicipline_status.update!(dicipline_status_params)
        render json: { status: "success", data: @dicipline_status }
      end
    end
  end

  # DELETE /dicipline_statuses/1.json
  def destroy
    dicipline_status = DiciplineStatus.find_by(id: params[:id])

    if dicipline_status
      begin
        if dicipline_status.destroy!
          render json: { message: I18n.t("dicipline_status.successful_destroyed") }, status: 204
        end
      end
    end
  end

  private

  FILTER_PARAMS = []

  def load_dicipline_statuses
    @dicipline_statuses = DiciplineStatus.filter(params.slice(*FILTER_PARAMS))
  end

    def set_dicipline_status
      begin
        @dicipline_status = DiciplineStatus.find(params[:id])
      rescue => e
        handle_exception(e, I18n.t("activerecord.models.dicipline_status"), params[:id])
      end
    end

    def dicipline_status_params
      params.require(:dicipline_status).permit(:name)
    end
end
