require "test_helper"

class DeficienciesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @deficiency = deficiencies(:one)
  end

  test "should get index" do
    get deficiencies_url, as: :json
    assert_response :success
  end

  test "should create deficiency" do
    assert_difference("Deficiency.count") do
      post deficiencies_url, params: { deficiency: { name: @deficiency.name } }, as: :json
    end

    assert_response :created
  end

  test "should show deficiency" do
    get deficiency_url(@deficiency), as: :json
    assert_response :success
  end

  test "should update deficiency" do
    patch deficiency_url(@deficiency), params: { deficiency: { name: @deficiency.name } }, as: :json
    assert_response :success
  end

  test "should destroy deficiency" do
    assert_difference("Deficiency.count", -1) do
      delete deficiency_url(@deficiency), as: :json
    end

    assert_response :no_content
  end
end
