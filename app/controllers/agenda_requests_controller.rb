class AgendaRequestsController < ApplicationController
  before_action :set_agenda_request, only: %i[ show update destroy approve_request]

  def index
    load_agenda_requests

    @agenda_requests_before_paginate = @agenda_requests.size
    @agenda_requests = @agenda_requests.then(&paginate)
    @page_no = page_no
    render(template: "agenda_requests/index", formats: :json)
  end

  def show
    @agenda_requests = AgendaRequest.find(params[:id])
    render(template: "agenda_requests/show", formats: :json)
  end

  def create
    begin
      @agenda_request = AgendaRequest.new(agenda_request_params)

      if @agenda_request.save
        render json: { status: "success", data: @agenda_request }, status: 201
      else
        render json: handle_unprocessable_entity(@agenda_request.errors), status: :unprocessable_entity
      end
    rescue => e
      handle_exception(e)
    end
  end

  def update
    begin
      if @agenda_request.update(agenda_request_params)
        render json: { status: "success", data: @agenda_request }
      else
        render json: handle_unprocessable_entity(@agenda_request.errors), status: :unprocessable_entity
      end
    rescue => e
      handle_exception(e)
    end
  end

  def destroy
    agenda_request = AgendaRequest.find_by(id: params[:id])

    if agenda_request
      begin
        if agenda_request.destroy
          render json: { message: I18n.t("agenda_request.successful_destroyed") }, status: 204
        end
      rescue => e
        handle_exception(e)
      end
    end
  end

  def approve_request
    begin
      if @agenda_request.approve(current_user)
        head :no_content
      else
        render json: handle_unprocessable_entity(@agenda_request.errors), status: :unprocessable_entity
      end
    rescue => e
      handle_exception(e)
    end
  end

  def statuses
    status = AgendaRequest.statuses.map do |status|
      { id: status.last, name: I18n.t("enums.agenda_request.status")[status.first.to_sym] }
    end

    render json: { status: status.as_json }, status: 200
  end

  private

    FILTER_PARAMS = [:local, :requester_id, :requested_id, :requesting_user_id, :approving_user_id,
                     :city_id, :status]

    def load_agenda_requests
      @agenda_requests = AgendaRequest.filter(params.slice(*FILTER_PARAMS)).order("created_at")
    end

    def set_agenda_request
      begin
        @agenda_request = AgendaRequest.find(params[:id])
      rescue => e
        handle_exception(e, I18n.t("activerecord.models.agenda_request"), params[:id])
      end
    end

    def agenda_request_params
      params.require(:agenda_request)
            .permit(
              :cellphone_number,
              :email,
              :local,
              :subject,
              :observations,
              :infos,
              :status,
              :city_id,
              :requester_id,
              :requested_id,
              :requesting_user_id,
              :approving_user_id,
              :approval_date
            )
    end
end
