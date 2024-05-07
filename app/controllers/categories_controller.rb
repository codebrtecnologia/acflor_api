class CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show update destroy ]
  def index
    load_categories

    @categories_before_paginate = @categories.size
    @categories = @categories.then(&paginate)
    @page_no = page_no
    render(template: "categories/index", formats: :json)
  end

  def show
    @categories = Category.find(params[:id])
    render(template: "categories/show", formats: :json)
  end

  def create
    begin
      @category = Category.new(category_params)

      if @category.save
        render json: { status: "success", data: @category }, status: 201
      else
        render json: handle_unprocessable_entity(@category.errors), status: :unprocessable_entity
      end
    rescue => e
      handle_exception(e)
    end
  end

  def update
    begin
      if @category.update(category_params)
        render json: { status: "success", data: @category }
      else
        render json: handle_unprocessable_entity(@category.errors), status: :unprocessable_entity
      end
    rescue => e
      handle_exception(e)
    end
  end

  def destroy
    category = Category.find_by(id: params[:id])

    if category
      begin
        if category.destroy
          render json: { message: I18n.t("category.successful_destroyed") }, status: 204
        end
      rescue => e
        handle_exception(e)
      end
    end
  end

  private

    FILTER_PARAMS = [:name]

    def load_categories
      @categories = Category.filter(params.slice(*FILTER_PARAMS)).order("LOWER(name)")
    end

    def set_category
      begin
        @category = Category.find(params[:id])
      rescue => e
        handle_exception(e, I18n.t("activerecord.models.category"), params[:id])
      end
    end

    def category_params
      params.require(:category)
            .permit(
              :name
            )
    end
end
