class UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy set_email]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show; end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @user.password = params[:password] if params[:password].present?

    if @user.save
      render :show, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if @user.update(user_params)
      render :show, status: :ok, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
  end

  # GET /users/list_names
  def list_names
    @users = User.select(:id, :name)
    render(template: 'users/list_names', formats: :json)
  end

  # PATCH/PUT /users/set_email/1
  # PATCH/PUT /users/set_email/1.json
  def set_email
    email = params[:email] if params[:email].present?

    set_params = {
      'email': email
    }

    ActiveRecord::Base.transaction do
      if @user.update(set_params)
        @person = Person.find(@user.person_id)
        if !@person.nil? && !@person.update(set_params)
          render json: @person.errors, status: :unprocessable_entity
          raise ActiveRecord::Rollback
        end
        render :show, status: :ok, location: @user
      else
        render json: @user.errors, status: :unprocessable_entity
        raise ActiveRecord::Rollback
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    # params.fetch(:user, {})
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :password_confirmation,
      :person_id,
      :ability_profile_id
    )
  end
end
