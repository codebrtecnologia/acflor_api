require "test_helper"

class TerritoryNeighborhoodsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @territory_neighborhood = territory_neighborhoods(:one)
  end

  test "should get index" do
    get territory_neighborhoods_url, as: :json
    assert_response :success
  end

  test "should create territory_neighborhood" do
    assert_difference("TerritoryNeighborhood.count") do
      post territory_neighborhoods_url, params: { territory_neighborhood: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show territory_neighborhood" do
    get territory_neighborhood_url(@territory_neighborhood), as: :json
    assert_response :success
  end

  test "should update territory_neighborhood" do
    patch territory_neighborhood_url(@territory_neighborhood), params: { territory_neighborhood: {  } }, as: :json
    assert_response :success
  end

  test "should destroy territory_neighborhood" do
    assert_difference("TerritoryNeighborhood.count", -1) do
      delete territory_neighborhood_url(@territory_neighborhood), as: :json
    end

    assert_response :no_content
  end
end
