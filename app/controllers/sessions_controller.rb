class SessionsController < DeviseTokenAuth::SessionsController
  before_action :check_active_user, only: [:create]

  def render_create_success
    render(template: "users/success", formats: :json)
  end

  private

  def check_active_user
    puts "params[:email] ==> #{params[:email]}"
    user = User.find_by_email(params[:email])
    puts "USER ==> #{user.inspect}"
    if user.nil?
      render json: { errors: ["Erro ao efetuar login, usuário ou senha incorretos!"] }, status: :unprocessable_entity
    elsif !user.active
      render json: { errors: ["Conta desativada, por gentileza, contate o(a) Administrador(a) do sistema!"] }, status: :unprocessable_entity
    end
  end

end