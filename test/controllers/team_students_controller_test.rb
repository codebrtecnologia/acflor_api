require "test_helper"

class TeamStudentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @team_student = team_students(:one)
  end

  test "should get index" do
    get team_students_url, as: :json
    assert_response :success
  end

  test "should create team_student" do
    assert_difference("TeamStudent.count") do
      post team_students_url, params: { team_student: { registration_number: @team_student.registration_number, student_id: @team_student.student_id, team_id: @team_student.team_id } }, as: :json
    end

    assert_response :created
  end

  test "should show team_student" do
    get team_student_url(@team_student), as: :json
    assert_response :success
  end

  test "should update team_student" do
    patch team_student_url(@team_student), params: { team_student: { registration_number: @team_student.registration_number, student_id: @team_student.student_id, team_id: @team_student.team_id } }, as: :json
    assert_response :success
  end

  test "should destroy team_student" do
    assert_difference("TeamStudent.count", -1) do
      delete team_student_url(@team_student), as: :json
    end

    assert_response :no_content
  end
end
