require "test_helper"

class PersonMailerTest < ActionMailer::TestCase
  test "send_token" do
    mail = PersonMailer.send_token
    assert_equal "Send token", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
