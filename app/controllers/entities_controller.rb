class EntitiesController < ApplicationController
  before_action :set_entity, only: %i[ show update destroy ]

  # GET /entities.json
  def index
    load_entities

    @entities_before_paginate = @entities.size
    @entities = @entities.then(&paginate)
    @page_no = page_no
    render(template: "entities/index", formats: :json)
  end

  # GET /entities/1.json
  def show
    @entities = Entity.find(params[:id])
    render(template: "entities/show", formats: :json)
  end

  # POST /entities.json
  def create
    begin
      @entity = Entity.new(entity_params)

      if @entity.save!
        render json: { status: "success", data: @entity }, status: 201
      end
    end
  end

  # PATCH/PUT /entities/1.json
  def update
    begin
      if @entity.update!(entity_params)
        render json: { status: "success", data: @entity }
      end
    end
  end

  # DELETE /entities/1.json
  def destroy
    entity = Entity.find_by(id: params[:id])

    if entity
      begin
        if entity.destroy!
          render json: { message: I18n.t("entity.successful_destroyed") }, status: 204
        end
      end
    end
  end

  private

  FILTER_PARAMS = []

  def load_entities
    @entities = Entity.filter(params.slice(*FILTER_PARAMS))
  end

  def set_entity
    begin
      @entity = Entity.find(params[:id])
    rescue => e
      handle_exception(e, I18n.t("activerecord.models.entity"), params[:id])
    end
  end

  def entity_params
    params.require(:entity).permit(:name, :responsible, :telephone, :email)
  end
end
