require "test_helper"

class LessonViewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lesson_view = lesson_views(:one)
  end

  test "should get index" do
    get lesson_views_url, as: :json
    assert_response :success
  end

  test "should create lesson_view" do
    assert_difference("LessonView.count") do
      post lesson_views_url, params: { lesson_view: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show lesson_view" do
    get lesson_view_url(@lesson_view), as: :json
    assert_response :success
  end

  test "should update lesson_view" do
    patch lesson_view_url(@lesson_view), params: { lesson_view: {  } }, as: :json
    assert_response :success
  end

  test "should destroy lesson_view" do
    assert_difference("LessonView.count", -1) do
      delete lesson_view_url(@lesson_view), as: :json
    end

    assert_response :no_content
  end
end
