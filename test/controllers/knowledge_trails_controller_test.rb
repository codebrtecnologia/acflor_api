require "test_helper"

class KnowledgeTrailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @knowledge_trail = knowledge_trails(:one)
  end

  test "should get index" do
    get knowledge_trails_url, as: :json
    assert_response :success
  end

  test "should create knowledge_trail" do
    assert_difference("KnowledgeTrail.count") do
      post knowledge_trails_url, params: { knowledge_trail: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show knowledge_trail" do
    get knowledge_trail_url(@knowledge_trail), as: :json
    assert_response :success
  end

  test "should update knowledge_trail" do
    patch knowledge_trail_url(@knowledge_trail), params: { knowledge_trail: {  } }, as: :json
    assert_response :success
  end

  test "should destroy knowledge_trail" do
    assert_difference("KnowledgeTrail.count", -1) do
      delete knowledge_trail_url(@knowledge_trail), as: :json
    end

    assert_response :no_content
  end
end
