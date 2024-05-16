class UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy set_email]

  def index
    @users = User.all

    @users_before_paginate = @users.size
    @users = @users.then(&paginate)
    @page_no = page_no
    render(template: "users/index", formats: :json)
  end

  def show
    @users = User.find(params[:id])
    render(template: "users/show", formats: :json)
  end

  def create
    @user = User.new(user_params)
    @user.password = params[:password] if params[:password].present?

    if @user.save!
      render json: { status: "success", data: @user }, status: 201
    end
  end

  def update
    begin
      if @user.update!(user_params)
        render json: { status: "success", data: @user }
      end
    end
  end

  def destroy
    @user.destroy!
  end

  def list_names
    @users = User.select(:id, :name)
    render(template: 'users/list_names', formats: :json)
  end

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
      :ability_profile_id
    )
  end
end
