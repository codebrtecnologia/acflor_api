require "test_helper"

class CourseDiciplinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @course_dicipline = course_diciplines(:one)
  end

  test "should get index" do
    get course_diciplines_url, as: :json
    assert_response :success
  end

  test "should create course_dicipline" do
    assert_difference("CourseDicipline.count") do
      post course_diciplines_url, params: { course_dicipline: { active: @course_dicipline.active, course_id: @course_dicipline.course_id, dicipline_id: @course_dicipline.dicipline_id } }, as: :json
    end

    assert_response :created
  end

  test "should show course_dicipline" do
    get course_dicipline_url(@course_dicipline), as: :json
    assert_response :success
  end

  test "should update course_dicipline" do
    patch course_dicipline_url(@course_dicipline), params: { course_dicipline: { active: @course_dicipline.active, course_id: @course_dicipline.course_id, dicipline_id: @course_dicipline.dicipline_id } }, as: :json
    assert_response :success
  end

  test "should destroy course_dicipline" do
    assert_difference("CourseDicipline.count", -1) do
      delete course_dicipline_url(@course_dicipline), as: :json
    end

    assert_response :no_content
  end
end
