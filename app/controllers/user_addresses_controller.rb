class UserAddressesController < ApplicationController
  before_action :set_user_address, only: %i[ show update destroy ]

  # GET /user_addresses.json
  def index
    load_user_addresses

    @user_addresses_before_paginate = @user_addresses.size
    @user_addresses = @user_addresses.then(&paginate)
    @page_no = page_no
    render(template: "user_addresses/index", formats: :json)
  end

  # GET /user_addresses/1.json
  def show
    @user_addresses = UserAddress.find(params[:id])
    render(template: "user_addresses/show", formats: :json)
  end

  # POST /user_addresses.json
  def create
    begin
      @user_address = UserAddress.new(user_address_params)

      if @user_address.save!
        render json: { status: "success", data: @user_address }, status: 201
      end
    end
  end

  # PATCH/PUT /user_addresses/1.json
  def update
    begin
      if @user_address.update!(user_address_params)
        render json: { status: "success", data: @user_address }
      end
    end
  end

  # DELETE /user_addresses/1.json
  def destroy
    user_address = UserAddress.find_by(id: params[:id])

    if user_address
      begin
        if user_address.destroy!
          render json: { message: I18n.t("user_address.successful_destroyed") }, status: 204
        end
      end
    end
  end

  private

  FILTER_PARAMS = []

  def load_user_addresses
    @user_addresses = UserAddress.filter(params.slice(*FILTER_PARAMS))
  end

    def set_user_address
      begin
        @user_address = UserAddress.find(params[:id])
      rescue => e
        handle_exception(e, I18n.t("activerecord.models.user_address"), params[:id])
      end
    end

    # Only allow a list of trusted parameters through.
    def user_address_params
      params.require(:user_address).permit(:street, :neighborhood, :city, :zip_code, :user_id)
    end
end
