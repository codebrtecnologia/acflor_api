require "test_helper"

class ClassesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @classe = classes(:one)
  end

  test "should get index" do
    get classes_url, as: :json
    assert_response :success
  end

  test "should create classe" do
    assert_difference("Classe.count") do
      post classes_url, params: { classe: { date: @classe.date, description: @classe.description, end_time: @classe.end_time, name: @classe.name, shift: @classe.shift, start_time: @classe.start_time, teacher_id: @classe.teacher_id, team_id: @classe.team_id } }, as: :json
    end

    assert_response :created
  end

  test "should show classe" do
    get classe_url(@classe), as: :json
    assert_response :success
  end

  test "should update classe" do
    patch classe_url(@classe), params: { classe: { date: @classe.date, description: @classe.description, end_time: @classe.end_time, name: @classe.name, shift: @classe.shift, start_time: @classe.start_time, teacher_id: @classe.teacher_id, team_id: @classe.team_id } }, as: :json
    assert_response :success
  end

  test "should destroy classe" do
    assert_difference("Classe.count", -1) do
      delete classe_url(@classe), as: :json
    end

    assert_response :no_content
  end
end
