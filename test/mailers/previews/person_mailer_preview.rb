# Preview all emails at http://localhost:3000/rails/mailers/person_mailer
class PersonMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/person_mailer/send_token
  def send_token
    PersonMailer.send_token
  end

end
