require "test_helper"

class CourseClassesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @course_class = course_classes(:one)
  end

  test "should get index" do
    get course_classes_url, as: :json
    assert_response :success
  end

  test "should create course_class" do
    assert_difference("CourseClass.count") do
      post course_classes_url, params: { course_class: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show course_class" do
    get course_class_url(@course_class), as: :json
    assert_response :success
  end

  test "should update course_class" do
    patch course_class_url(@course_class), params: { course_class: {  } }, as: :json
    assert_response :success
  end

  test "should destroy course_class" do
    assert_difference("CourseClass.count", -1) do
      delete course_class_url(@course_class), as: :json
    end

    assert_response :no_content
  end
end
