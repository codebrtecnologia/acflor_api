require "test_helper"

class PublicBodiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @public_body = public_bodies(:one)
  end

  test "should get index" do
    get public_bodies_url, as: :json
    assert_response :success
  end

  test "should create public_body" do
    assert_difference("PublicBody.count") do
      post public_bodies_url, params: { public_body: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show public_body" do
    get public_body_url(@public_body), as: :json
    assert_response :success
  end

  test "should update public_body" do
    patch public_body_url(@public_body), params: { public_body: {  } }, as: :json
    assert_response :success
  end

  test "should destroy public_body" do
    assert_difference("PublicBody.count", -1) do
      delete public_body_url(@public_body), as: :json
    end

    assert_response :no_content
  end
end
