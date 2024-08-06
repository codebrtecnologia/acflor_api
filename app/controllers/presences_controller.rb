class PresencesController < ApplicationController
  before_action :set_presence, only: %i[ show update destroy ]

  # GET /presences.json
  def index
    load_presences

    @presences_before_paginate = @presences.size
    @presences = @presences.then(&paginate)
    @page_no = page_no
    render(template: "presences/index", formats: :json)
  end

  # GET /presences/1.json
  def show
    @presences = Presence.find(params[:id])
    render(template: "presences/show", formats: :json)
  end

  # POST /presences.json
  def create
    begin
      @presence = Presence.new(presence_params)

      if @presence.save!
        render json: { status: "success", data: @presence }, status: 201
      end
    end
  end

  # PATCH/PUT /presences/1.json
  def update
    begin
      if @presence.update!(presence_params)
        render json: { status: "success", data: @presence }
      end
    end
  end

  # DELETE /presences/1.json
  def destroy
    presence = Presence.find_by(id: params[:id])

    if presence
      begin
        if presence.destroy!
          render json: { message: I18n.t("presence.successful_destroyed") }, status: 204
        end
      end
    end
  end

  private

  FILTER_PARAMS = []

  def load_presences
    @presences = Presence.filter(params.slice(*FILTER_PARAMS))
  end

  def set_presence
    begin
      @presence = Presence.find(params[:id])
      rescue => e
      handle_exception(e, I18n.t("activerecord.models.presence"), params[:id])
    end
  end

  def presence_params
    params.require(:presence).permit(:presence, :justification, :classe_id, :student_id, :team_id)
  end
end
