require "test_helper"

class KnowledgeTrailAreasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @knowledge_trail_area = knowledge_trail_areas(:one)
  end

  test "should get index" do
    get knowledge_trail_areas_url, as: :json
    assert_response :success
  end

  test "should create knowledge_trail_area" do
    assert_difference("KnowledgeTrailArea.count") do
      post knowledge_trail_areas_url, params: { knowledge_trail_area: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show knowledge_trail_area" do
    get knowledge_trail_area_url(@knowledge_trail_area), as: :json
    assert_response :success
  end

  test "should update knowledge_trail_area" do
    patch knowledge_trail_area_url(@knowledge_trail_area), params: { knowledge_trail_area: {  } }, as: :json
    assert_response :success
  end

  test "should destroy knowledge_trail_area" do
    assert_difference("KnowledgeTrailArea.count", -1) do
      delete knowledge_trail_area_url(@knowledge_trail_area), as: :json
    end

    assert_response :no_content
  end
end
