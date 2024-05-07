require "test_helper"

class InterestAreasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @interest_area = interest_areas(:one)
  end

  test "should get index" do
    get interest_areas_url, as: :json
    assert_response :success
  end

  test "should create interest_area" do
    assert_difference("InterestArea.count") do
      post interest_areas_url, params: { interest_area: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show interest_area" do
    get interest_area_url(@interest_area), as: :json
    assert_response :success
  end

  test "should update interest_area" do
    patch interest_area_url(@interest_area), params: { interest_area: {  } }, as: :json
    assert_response :success
  end

  test "should destroy interest_area" do
    assert_difference("InterestArea.count", -1) do
      delete interest_area_url(@interest_area), as: :json
    end

    assert_response :no_content
  end
end
