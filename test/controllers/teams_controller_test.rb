require "test_helper"

class TeamsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @team = teams(:one)
  end

  test "should get index" do
    get teams_url, as: :json
    assert_response :success
  end

  test "should create team" do
    assert_difference("Team.count") do
      post teams_url, params: { team: { active: @team.active, closing: @team.closing, code: @team.code, course_id: @team.course_id, start: @team.start, teacher_id: @team.teacher_id } }, as: :json
    end

    assert_response :created
  end

  test "should show team" do
    get team_url(@team), as: :json
    assert_response :success
  end

  test "should update team" do
    patch team_url(@team), params: { team: { active: @team.active, closing: @team.closing, code: @team.code, course_id: @team.course_id, start: @team.start, teacher_id: @team.teacher_id } }, as: :json
    assert_response :success
  end

  test "should destroy team" do
    assert_difference("Team.count", -1) do
      delete team_url(@team), as: :json
    end

    assert_response :no_content
  end
end
