require "test_helper"

class EntityCoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @entity_course = entity_courses(:one)
  end

  test "should get index" do
    get entity_courses_url, as: :json
    assert_response :success
  end

  test "should create entity_course" do
    assert_difference("EntityCourse.count") do
      post entity_courses_url, params: { entity_course: { course_id: @entity_course.course_id, entity_id: @entity_course.entity_id } }, as: :json
    end

    assert_response :created
  end

  test "should show entity_course" do
    get entity_course_url(@entity_course), as: :json
    assert_response :success
  end

  test "should update entity_course" do
    patch entity_course_url(@entity_course), params: { entity_course: { course_id: @entity_course.course_id, entity_id: @entity_course.entity_id } }, as: :json
    assert_response :success
  end

  test "should destroy entity_course" do
    assert_difference("EntityCourse.count", -1) do
      delete entity_course_url(@entity_course), as: :json
    end

    assert_response :no_content
  end
end
