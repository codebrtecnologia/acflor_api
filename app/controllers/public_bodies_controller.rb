class PublicBodiesController < ApplicationController
  before_action :set_public_body, only: %i[ show update destroy ]

  def index
    load_public_bodies

    @public_bodies_before_paginate = @public_bodies.size
    @public_bodies = @public_bodies.then(&paginate)
    @page_no = page_no
    render(template: "public_bodies/index", formats: :json)
  end

  def show
    @public_bodies = PublicBody.find(params[:id])
    render(template: "public_bodies/show", formats: :json)
  end

  def create
    begin
      @public_body = PublicBody.new(public_body_params)

      if @public_body.save!
        render json: { status: "success", data: @public_body }, status: 201
      end
    end
  end

  def update
    begin
      if @public_body.update!(public_body_params)
        render json: { status: "success", data: @public_body }
      end
    end
  end

  def destroy
    public_body = PublicBody.find_by(id: params[:id])

    if public_body
      begin
        if public_body.destroy!
          render json: { message: I18n.t("public_body.successful_destroyed") }, status: 204
        end
      end
    end
  end

  private
    FILTER_PARAMS = [:name]

    def load_public_bodies
      @public_bodies = PublicBody.filter(params.slice(*FILTER_PARAMS)).order("LOWER(name)")
    end

    def set_public_body
      begin
        @public_body = PublicBody.find(params[:id])
      rescue => e
        handle_exception(e, I18n.t("activerecord.models.public_body"), params[:id])
      end
    end

    # Only allow a list of trusted parameters through.
    def public_body_params
      params.require(:public_body)
            .permit(
              :name
            )
    end

end
