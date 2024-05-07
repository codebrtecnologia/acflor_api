require "test_helper"

class TerritoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @territory = territories(:one)
  end

  test "should get index" do
    get territories_url, as: :json
    assert_response :success
  end

  test "should create territory" do
    assert_difference("Territory.count") do
      post territories_url, params: { territory: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show territory" do
    get territory_url(@territory), as: :json
    assert_response :success
  end

  test "should update territory" do
    patch territory_url(@territory), params: { territory: {  } }, as: :json
    assert_response :success
  end

  test "should destroy territory" do
    assert_difference("Territory.count", -1) do
      delete territory_url(@territory), as: :json
    end

    assert_response :no_content
  end
end
