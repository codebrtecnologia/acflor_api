class AbilityResourcesController < ApplicationController
  before_action :set_ability_resource, only: %i[show update destroy]

  # GET /ability_resources
  # GET /ability_resources.json
  def index
    @ability_resources = AbilityResource.all
  end

  # GET /ability_resources/1
  # GET /ability_resources/1.json
  def show; end

  # POST /ability_resources
  # POST /ability_resources.json
  def create
    @ability_resource = AbilityResource.new(ability_resource_params)

    if @ability_resource.save!
      render :show, status: :created, location: @ability_resource
    else
      render json: @ability_resource.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ability_resources/1
  # PATCH/PUT /ability_resources/1.json
  def update
    if @ability_resource.update!(ability_resource_params)
      render :show, status: :ok, location: @ability_resource
    else
      render json: @ability_resource.errors, status: :unprocessable_entity
    end
  end

  # DELETE /ability_resources/1
  # DELETE /ability_resources/1.json
  def destroy
    @ability_resource.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_ability_resource
    @ability_resource = AbilityResource.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def ability_resource_params
    # params.fetch(:ability_resource, {})
    params.require(:ability_resource).permit(
      :name
    )
  end
end
