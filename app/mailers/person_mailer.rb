class PersonMailer < ApplicationMailer
  def send_email_token(user)
    @user = user

    mail(
      to: @user.email,
      subject: 'Atualização de Senha - #ElasPorElas'
    )
  end
end
