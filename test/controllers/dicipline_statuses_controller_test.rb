require "test_helper"

class DiciplineStatusesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dicipline_status = dicipline_statuses(:one)
  end

  test "should get index" do
    get dicipline_statuses_url, as: :json
    assert_response :success
  end

  test "should create dicipline_status" do
    assert_difference("DiciplineStatus.count") do
      post dicipline_statuses_url, params: { dicipline_status: { name: @dicipline_status.name } }, as: :json
    end

    assert_response :created
  end

  test "should show dicipline_status" do
    get dicipline_status_url(@dicipline_status), as: :json
    assert_response :success
  end

  test "should update dicipline_status" do
    patch dicipline_status_url(@dicipline_status), params: { dicipline_status: { name: @dicipline_status.name } }, as: :json
    assert_response :success
  end

  test "should destroy dicipline_status" do
    assert_difference("DiciplineStatus.count", -1) do
      delete dicipline_status_url(@dicipline_status), as: :json
    end

    assert_response :no_content
  end
end
