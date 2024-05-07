require "test_helper"

class KnowledgeTrailCoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @knowledge_trail_course = knowledge_trail_courses(:one)
  end

  test "should get index" do
    get knowledge_trail_courses_url, as: :json
    assert_response :success
  end

  test "should create knowledge_trail_course" do
    assert_difference("KnowledgeTrailCourse.count") do
      post knowledge_trail_courses_url, params: { knowledge_trail_course: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show knowledge_trail_course" do
    get knowledge_trail_course_url(@knowledge_trail_course), as: :json
    assert_response :success
  end

  test "should update knowledge_trail_course" do
    patch knowledge_trail_course_url(@knowledge_trail_course), params: { knowledge_trail_course: {  } }, as: :json
    assert_response :success
  end

  test "should destroy knowledge_trail_course" do
    assert_difference("KnowledgeTrailCourse.count", -1) do
      delete knowledge_trail_course_url(@knowledge_trail_course), as: :json
    end

    assert_response :no_content
  end
end
