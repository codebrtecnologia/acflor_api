require "test_helper"

class ModuleDocumentViewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @module_document_view = module_document_views(:one)
  end

  test "should get index" do
    get module_document_views_url, as: :json
    assert_response :success
  end

  test "should create module_document_view" do
    assert_difference("ModuleDocumentView.count") do
      post module_document_views_url, params: { module_document_view: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show module_document_view" do
    get module_document_view_url(@module_document_view), as: :json
    assert_response :success
  end

  test "should update module_document_view" do
    patch module_document_view_url(@module_document_view), params: { module_document_view: {  } }, as: :json
    assert_response :success
  end

  test "should destroy module_document_view" do
    assert_difference("ModuleDocumentView.count", -1) do
      delete module_document_view_url(@module_document_view), as: :json
    end

    assert_response :no_content
  end
end
