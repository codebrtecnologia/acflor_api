require "test_helper"

class DiciplinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dicipline = diciplines(:one)
  end

  test "should get index" do
    get diciplines_url, as: :json
    assert_response :success
  end

  test "should create dicipline" do
    assert_difference("Dicipline.count") do
      post diciplines_url, params: { dicipline: { code~: @dicipline.code~, name: @dicipline.name } }, as: :json
    end

    assert_response :created
  end

  test "should show dicipline" do
    get dicipline_url(@dicipline), as: :json
    assert_response :success
  end

  test "should update dicipline" do
    patch dicipline_url(@dicipline), params: { dicipline: { code~: @dicipline.code~, name: @dicipline.name } }, as: :json
    assert_response :success
  end

  test "should destroy dicipline" do
    assert_difference("Dicipline.count", -1) do
      delete dicipline_url(@dicipline), as: :json
    end

    assert_response :no_content
  end
end
