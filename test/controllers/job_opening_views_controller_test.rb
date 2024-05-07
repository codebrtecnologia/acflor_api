require "test_helper"

class JobOpeningViewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @job_opening_view = job_opening_views(:one)
  end

  test "should get index" do
    get job_opening_views_url, as: :json
    assert_response :success
  end

  test "should create job_opening_view" do
    assert_difference("JobOpeningView.count") do
      post job_opening_views_url, params: { job_opening_view: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show job_opening_view" do
    get job_opening_view_url(@job_opening_view), as: :json
    assert_response :success
  end

  test "should update job_opening_view" do
    patch job_opening_view_url(@job_opening_view), params: { job_opening_view: {  } }, as: :json
    assert_response :success
  end

  test "should destroy job_opening_view" do
    assert_difference("JobOpeningView.count", -1) do
      delete job_opening_view_url(@job_opening_view), as: :json
    end

    assert_response :no_content
  end
end
