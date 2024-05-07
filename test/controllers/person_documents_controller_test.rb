require "test_helper"

class PersonDocumentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @person_document = person_documents(:one)
  end

  test "should get index" do
    get person_documents_url, as: :json
    assert_response :success
  end

  test "should create person_document" do
    assert_difference("PersonDocument.count") do
      post person_documents_url, params: { person_document: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show person_document" do
    get person_document_url(@person_document), as: :json
    assert_response :success
  end

  test "should update person_document" do
    patch person_document_url(@person_document), params: { person_document: {  } }, as: :json
    assert_response :success
  end

  test "should destroy person_document" do
    assert_difference("PersonDocument.count", -1) do
      delete person_document_url(@person_document), as: :json
    end

    assert_response :no_content
  end
end
