class EntityAddressesController < ApplicationController
  before_action :set_entity_address, only: %i[ show update destroy ]

  # GET /entity_addresses.json
  def index
    load_entity_addresses

    @entity_addresses_before_paginate = @entity_addresses.size
    @entity_addresses = @entity_addresses.then(&paginate)
    @page_no = page_no
    render(template: "entity_addresses/index", formats: :json)
  end

  # GET /entity_addresses/1.json
  def show
    @entity_addresses = EntityAddress.find(params[:id])
    render(template: "entity_addresses/show", formats: :json)
  end

  # POST /entity_addresses.json
  def create
    begin
      @entity_address = EntityAddress.new(entity_address_params)

      if @entity_address.save!
        render json: { status: "success", data: @entity_address }, status: 201
      end
    end
  end

  # PATCH/PUT /entity_addresses/1.json
  def update
    begin
      if @entity_address.update!(entity_address_params)
        render json: { status: "success", data: @entity_address }
      end
    end
  end

  # DELETE /entity_addresses/1.json
  def destroy
    entity_address = EntityAddress.find_by(id: params[:id])

    if entity_address
      begin
        if entity_address.destroy!
          render json: { message: I18n.t("entity_address.successful_destroyed") }, status: 204
        end
      end
    end
  end

  private

  FILTER_PARAMS = []

  def load_entity_addresses
    @entity_addresses = EntityAddress.filter(params.slice(*FILTER_PARAMS))
  end

  def set_entity_address
    begin
      @entity_address = EntityAddress.find(params[:id])
    rescue => e
      handle_exception(e, I18n.t("activerecord.models.entity_address"), params[:id])
    end
  end

    def entity_address_params
      params.require(:entity_address).permit(:street, :neighborhood, :city, :zip_code, :entity_id)
    end
end
