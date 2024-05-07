require "test_helper"

class LessonDocumentViewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lesson_document_view = lesson_document_views(:one)
  end

  test "should get index" do
    get lesson_document_views_url, as: :json
    assert_response :success
  end

  test "should create lesson_document_view" do
    assert_difference("LessonDocumentView.count") do
      post lesson_document_views_url, params: { lesson_document_view: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show lesson_document_view" do
    get lesson_document_view_url(@lesson_document_view), as: :json
    assert_response :success
  end

  test "should update lesson_document_view" do
    patch lesson_document_view_url(@lesson_document_view), params: { lesson_document_view: {  } }, as: :json
    assert_response :success
  end

  test "should destroy lesson_document_view" do
    assert_difference("LessonDocumentView.count", -1) do
      delete lesson_document_view_url(@lesson_document_view), as: :json
    end

    assert_response :no_content
  end
end
