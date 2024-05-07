class AbilityProfilesController < ApplicationController
  before_action :set_ability_profile, only: %i[show update destroy]

  # GET /ability_profiles
  # GET /ability_profiles.json
  def index
    @ability_profiles = AbilityProfile.all
  end

  # GET /ability_profiles/1
  # GET /ability_profiles/1.json
  def show; end

  # POST /ability_profiles
  # POST /ability_profiles.json
  def create
    @ability_profile = AbilityProfile.new(ability_profile_params)

    if @ability_profile.save
      render :show, status: :created, location: @ability_profile
    else
      render json: @ability_profile.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ability_profiles/1
  # PATCH/PUT /ability_profiles/1.json
  def update
    if @ability_profile.update(ability_profile_params)
      render :show, status: :ok, location: @ability_profile
    else
      render json: @ability_profile.errors, status: :unprocessable_entity
    end
  end

  # DELETE /ability_profiles/1
  # DELETE /ability_profiles/1.json
  def destroy
    @ability_profile.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_ability_profile
    @ability_profile = AbilityProfile.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def ability_profile_params
    # params.fetch(:ability_profile, {})
    params.require(:ability_profile).permit(
      :name
    )
  end
end
