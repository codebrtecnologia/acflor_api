class AbilityActionsController < ApplicationController
  before_action :set_ability_action, only: %i[show update destroy]

  # GET /ability_actions
  # GET /ability_actions.json
  def index
    @ability_actions = AbilityAction.all
  end

  # GET /ability_actions/1
  # GET /ability_actions/1.json
  def show; end

  # POST /ability_actions
  # POST /ability_actions.json
  def create
    @ability_action = AbilityAction.new(ability_action_params)

    if @ability_action.save
      render :show, status: :created, location: @ability_action
    else
      render json: @ability_action.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ability_actions/1
  # PATCH/PUT /ability_actions/1.json
  def update
    if @ability_action.update(ability_action_params)
      render :show, status: :ok, location: @ability_action
    else
      render json: @ability_action.errors, status: :unprocessable_entity
    end
  end

  # DELETE /ability_actions/1
  # DELETE /ability_actions/1.json
  def destroy
    @ability_action.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_ability_action
    @ability_action = AbilityAction.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def ability_action_params
    # params.fetch(:ability_action, {})
    params.require(:ability_action).permit(
      :ability_resource_id,
      :name
    )
  end
end
