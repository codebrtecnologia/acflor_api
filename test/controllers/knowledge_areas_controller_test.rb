require "test_helper"

class KnowledgeAreasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @knowledge_area = knowledge_areas(:one)
  end

  test "should get index" do
    get knowledge_areas_url, as: :json
    assert_response :success
  end

  test "should create knowledge_area" do
    assert_difference("KnowledgeArea.count") do
      post knowledge_areas_url, params: { knowledge_area: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show knowledge_area" do
    get knowledge_area_url(@knowledge_area), as: :json
    assert_response :success
  end

  test "should update knowledge_area" do
    patch knowledge_area_url(@knowledge_area), params: { knowledge_area: {  } }, as: :json
    assert_response :success
  end

  test "should destroy knowledge_area" do
    assert_difference("KnowledgeArea.count", -1) do
      delete knowledge_area_url(@knowledge_area), as: :json
    end

    assert_response :no_content
  end
end
