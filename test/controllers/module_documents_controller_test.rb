require "test_helper"

class ModuleDocumentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @module_document = module_documents(:one)
  end

  test "should get index" do
    get module_documents_url, as: :json
    assert_response :success
  end

  test "should create module_document" do
    assert_difference("ModuleDocument.count") do
      post module_documents_url, params: { module_document: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show module_document" do
    get module_document_url(@module_document), as: :json
    assert_response :success
  end

  test "should update module_document" do
    patch module_document_url(@module_document), params: { module_document: {  } }, as: :json
    assert_response :success
  end

  test "should destroy module_document" do
    assert_difference("ModuleDocument.count", -1) do
      delete module_document_url(@module_document), as: :json
    end

    assert_response :no_content
  end
end
