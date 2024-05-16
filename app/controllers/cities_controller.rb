class CitiesController < ApplicationController
  before_action :set_city, only: %i[ show update destroy ]

  def index
    load_cities

    @cities_before_paginate = @cities.size
    @cities = @cities.then(&paginate)
    @page_no = page_no
    render(template: "cities/index", formats: :json)
  end

  def show
    @cities = City.find(params[:id])
    render(template: "cities/show", formats: :json)
  end

  def create
    begin
      @city = City.new(city_params)

      if @city.save!
        render json: { status: "success", data: @city }, status: 201
      end
    end
  end

  def update
    begin
      if @city.update!(city_params)
        render json: { status: "success", data: @city }
      end
    end
  end

  def destroy
    city = City.find_by(id: params[:id])

    if city
      begin
        if city.destroy!
          render json: { message: I18n.t("city.successful_destroyed") }, status: 204
        end
      end
    end
  end

  private

  FILTER_PARAMS = [:name]

  def load_cities
    @cities = City.filter(params.slice(*FILTER_PARAMS)).order("LOWER(name)")
  end

  def set_city
    begin
      @city = City.find(params[:id])
    rescue => e
      handle_exception(e, I18n.t("activerecord.models.city"), params[:id])
    end
  end

  def city_params
    params.require(:city)
          .permit(
            :name
          )
  end
end
