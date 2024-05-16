class AttendanceMailer < ApplicationMailer
  default from: 'matheusgadelha253@gmail.com'

  def attendance_email(person, event, current_user)
    @person = person
    @event = event
    @attendances = person.attendances.where(event: event)

    @attendances.each do |attendance|
      @token = attendance.confirmation_token
      mail(to: @person.email, subject: "Notificação para evento: #{@event.name}")

      EmailHistory.create!(
        attendance: attendance,
        user: current_user,
        subject: "Notificação para evento: #{event.name}",
        sent_at: Time.now,
        confirmation_token: @token,
        token_expiry: attendance.confirmation_token_expires_at
      )

      attendance.increment!(:email_sent_count)
    end
  end

end
