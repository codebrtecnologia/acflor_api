require "test_helper"

class InscriptionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @inscription = inscriptions(:one)
  end

  test "should get index" do
    get inscriptions_url, as: :json
    assert_response :success
  end

  test "should create inscription" do
    assert_difference("Inscription.count") do
      post inscriptions_url, params: { inscription: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show inscription" do
    get inscription_url(@inscription), as: :json
    assert_response :success
  end

  test "should update inscription" do
    patch inscription_url(@inscription), params: { inscription: {  } }, as: :json
    assert_response :success
  end

  test "should destroy inscription" do
    assert_difference("Inscription.count", -1) do
      delete inscription_url(@inscription), as: :json
    end

    assert_response :no_content
  end
end
