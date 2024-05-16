class AbilityPermissionsController < ApplicationController
  before_action :set_ability_permission, only: %i[show update destroy]

  # GET /ability_permissions
  # GET /ability_permissions.json
  def index
    @ability_permissions = AbilityPermission.all
  end

  # GET /ability_permissions/1
  # GET /ability_permissions/1.json
  def show; end

  # POST /ability_permissions
  # POST /ability_permissions.json
  def create
    @ability_permission = AbilityPermission.new(ability_permission_params)

    if @ability_permission.save!
      render :show, status: :created, location: @ability_permission
    else
      render json: @ability_permission.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ability_permissions/1
  # PATCH/PUT /ability_permissions/1.json
  def update
    if @ability_permission.update!(ability_permission_params)
      render :show, status: :ok, location: @ability_permission
    else
      render json: @ability_permission.errors, status: :unprocessable_entity
    end
  end

  # DELETE /ability_permissions/1
  # DELETE /ability_permissions/1.json
  def destroy
    @ability_permission.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_ability_permission
    @ability_permission = AbilityPermission.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def ability_permission_params
    # params.fetch(:ability_permission, {})
    params.require(:ability_permission).permit(
      :ability_profile_id,
      :ability_action_id
    )
  end
end
