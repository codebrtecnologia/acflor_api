class PasswordController < ApplicationController
  # PATCH/PUT /people/send_email_token
  # PATCH/PUT /people/send_email_token.json
  def send_email_token
    if current_user.nil?
      email = params[:email] if params[:email].present?

      if email.nil?
        render json: { errors: I18n.t('devise_token_auth.passwords.missing_email') },
               status: :not_acceptable and return
      end
    else
      email = current_user.email
    end

    @user = User.find_by(email)

    if @user.nil?
      render json: { errors: I18n.t('devise_token_auth.passwords.user_not_found', email) },
             status: :not_found and return
    end

    @friendly_token = Devise.friendly_token(8).upcase

    @user.reset_password_token = @friendly_token
    @user.reset_password_sent_at = Time.now.utc
    @user.save

    PersonMailer.send_email_token(@user).deliver_now
    render json: { success: true, message: I18n.t('devise_token_auth.token_validations.token_sent') }
  end

  # PATCH/PUT /people/reset_password
  # PATCH/PUT /people/reset_password.json
  def reset_password
    if current_user.nil?
      email = params[:email] if params[:email].present?
    else
      email = current_user.email
    end

    @user = User.find_by(email)

    if @user.nil?
      render json: { errors: I18n.t('devise_token_auth.passwords.user_not_found', email) },
             status: :not_found and return
    end

    if @user.reset_password_sent_at.present? &&
       @user.reset_password_token.upcase == params['reset_password_token'].upcase

      # Verifique se as senhas informadas correspondem
      if params[:password] == params[:password_confirmation]
        # Atualize a senha do usuário
        if @user.reset_password(params[:password], params[:password_confirmation])
          # 'Senha alterada com sucesso.'
          render json: { message: I18n.t('devise_token_auth.passwords.successfully_updated') }, status: :ok
        else
          render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
        end
      else
        # ['As senhas não correspondem.']
        render json: { errors: I18n.t('devise_token_auth.passwords.passwords_not_match') },
               status: :unprocessable_entity
      end
    else
      # ['O token de recuperação de senha é inválido ou expirou.']
      render json: { errors: I18n.t('devise_token_auth.token_validations.invalid') }, status: :unprocessable_entity
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def person_params
    # params.fetch(:person, {})
    params.require(:person).permit(
      :email,
      :password,
      :password_confirmation,
      :reset_password_token
    )
  end
end
