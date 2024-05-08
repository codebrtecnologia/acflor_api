require "test_helper"

class AgendaRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @agenda_request = agenda_requests(:one)
  end

  test "should get index" do
    get agenda_requests_url, as: :json
    assert_response :success
  end

  test "should create agenda_request" do
    assert_difference("AgendaRequest.count") do
      post agenda_requests_url, params: { agenda_request: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show agenda_request" do
    get agenda_request_url(@agenda_request), as: :json
    assert_response :success
  end

  test "should update agenda_request" do
    patch agenda_request_url(@agenda_request), params: { agenda_request: {  } }, as: :json
    assert_response :success
  end

  test "should destroy agenda_request" do
    assert_difference("AgendaRequest.count", -1) do
      delete agenda_request_url(@agenda_request), as: :json
    end

    assert_response :no_content
  end
end
