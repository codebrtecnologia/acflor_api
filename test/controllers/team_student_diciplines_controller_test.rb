require "test_helper"

class TeamStudentDiciplinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @team_student_dicipline = team_student_diciplines(:one)
  end

  test "should get index" do
    get team_student_diciplines_url, as: :json
    assert_response :success
  end

  test "should create team_student_dicipline" do
    assert_difference("TeamStudentDicipline.count") do
      post team_student_diciplines_url, params: { team_student_dicipline: { active: @team_student_dicipline.active, dicipline_id: @team_student_dicipline.dicipline_id, dicipline_status_id: @team_student_dicipline.dicipline_status_id, team_student_id: @team_student_dicipline.team_student_id } }, as: :json
    end

    assert_response :created
  end

  test "should show team_student_dicipline" do
    get team_student_dicipline_url(@team_student_dicipline), as: :json
    assert_response :success
  end

  test "should update team_student_dicipline" do
    patch team_student_dicipline_url(@team_student_dicipline), params: { team_student_dicipline: { active: @team_student_dicipline.active, dicipline_id: @team_student_dicipline.dicipline_id, dicipline_status_id: @team_student_dicipline.dicipline_status_id, team_student_id: @team_student_dicipline.team_student_id } }, as: :json
    assert_response :success
  end

  test "should destroy team_student_dicipline" do
    assert_difference("TeamStudentDicipline.count", -1) do
      delete team_student_dicipline_url(@team_student_dicipline), as: :json
    end

    assert_response :no_content
  end
end
