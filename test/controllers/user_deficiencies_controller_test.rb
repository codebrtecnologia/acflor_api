require "test_helper"

class UserDeficienciesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_deficiency = user_deficiencies(:one)
  end

  test "should get index" do
    get user_deficiencies_url, as: :json
    assert_response :success
  end

  test "should create user_deficiency" do
    assert_difference("UserDeficiency.count") do
      post user_deficiencies_url, params: { user_deficiency: { deficiency_id: @user_deficiency.deficiency_id, observations: @user_deficiency.observations, user_id: @user_deficiency.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show user_deficiency" do
    get user_deficiency_url(@user_deficiency), as: :json
    assert_response :success
  end

  test "should update user_deficiency" do
    patch user_deficiency_url(@user_deficiency), params: { user_deficiency: { deficiency_id: @user_deficiency.deficiency_id, observations: @user_deficiency.observations, user_id: @user_deficiency.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy user_deficiency" do
    assert_difference("UserDeficiency.count", -1) do
      delete user_deficiency_url(@user_deficiency), as: :json
    end

    assert_response :no_content
  end
end
