require "test_helper"

class CourseModulesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @course_module = course_modules(:one)
  end

  test "should get index" do
    get course_modules_url, as: :json
    assert_response :success
  end

  test "should create course_module" do
    assert_difference("CourseModule.count") do
      post course_modules_url, params: { course_module: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show course_module" do
    get course_module_url(@course_module), as: :json
    assert_response :success
  end

  test "should update course_module" do
    patch course_module_url(@course_module), params: { course_module: {  } }, as: :json
    assert_response :success
  end

  test "should destroy course_module" do
    assert_difference("CourseModule.count", -1) do
      delete course_module_url(@course_module), as: :json
    end

    assert_response :no_content
  end
end
