require "test_helper"

class LessonDocumentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lesson_document = lesson_documents(:one)
  end

  test "should get index" do
    get lesson_documents_url, as: :json
    assert_response :success
  end

  test "should create lesson_document" do
    assert_difference("LessonDocument.count") do
      post lesson_documents_url, params: { lesson_document: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show lesson_document" do
    get lesson_document_url(@lesson_document), as: :json
    assert_response :success
  end

  test "should update lesson_document" do
    patch lesson_document_url(@lesson_document), params: { lesson_document: {  } }, as: :json
    assert_response :success
  end

  test "should destroy lesson_document" do
    assert_difference("LessonDocument.count", -1) do
      delete lesson_document_url(@lesson_document), as: :json
    end

    assert_response :no_content
  end
end
