class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken

  include Errors
  include Pagination
  include Filterable

  before_action :can, :set_locale

  def can
    ability_action = AbilityAction.by_ability_resource(controller_name).find_by(name: action_name)
    return if ability_action.nil?

    if current_user.nil?
      render json: { errors: [I18n.t('devise.failure.unauthenticated')] }, status: :unauthorized and return
    end

    ability_permission = AbilityPermission.find_by(ability_profile_id: current_user.ability_profile_id,
                                                   ability_action_id: ability_action.id)
    return unless ability_permission.nil?

    render json: { errors: [I18n.t('errors.messages.method_not_allowed')] },
           status: :method_not_allowed and return
  end

  def clean_up_storage
    Dir.glob(Rails.root.join('storage', '**', '*').to_s).sort_by(&:length).reverse.each do |x|
      Dir.rmdir(x) if File.directory?(x) && Dir.empty?(x)
    end
  end

  def reset_storage
    FileUtils.rm_rf(ActiveStorage::Blob.service.root)
  end

  def friendly_token(length = 20)
    SecureRandom.base36(length)
  end

  def set_locale
    I18n.locale = valid_locale? ? params[:locale] : I18n.default_locale
  end

  private

  def valid_locale?
    param_locale.present? && I18n.available_locales.include?(param_locale.to_sym)
  end

  def param_locale
    params[:locale]
  end

end
