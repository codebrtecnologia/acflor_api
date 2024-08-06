require "test_helper"

class PresencesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @presence = presences(:one)
  end

  test "should get index" do
    get presences_url, as: :json
    assert_response :success
  end

  test "should create presence" do
    assert_difference("Presence.count") do
      post presences_url, params: { presence: { classe_id: @presence.classe_id, justification: @presence.justification, presence: @presence.presence, student_id: @presence.student_id, team_id: @presence.team_id } }, as: :json
    end

    assert_response :created
  end

  test "should show presence" do
    get presence_url(@presence), as: :json
    assert_response :success
  end

  test "should update presence" do
    patch presence_url(@presence), params: { presence: { classe_id: @presence.classe_id, justification: @presence.justification, presence: @presence.presence, student_id: @presence.student_id, team_id: @presence.team_id } }, as: :json
    assert_response :success
  end

  test "should destroy presence" do
    assert_difference("Presence.count", -1) do
      delete presence_url(@presence), as: :json
    end

    assert_response :no_content
  end
end
