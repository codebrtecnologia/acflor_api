require "test_helper"

class JobOpeningsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @job_opening = job_openings(:one)
  end

  test "should get index" do
    get job_openings_url, as: :json
    assert_response :success
  end

  test "should create job_opening" do
    assert_difference("JobOpening.count") do
      post job_openings_url, params: { job_opening: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show job_opening" do
    get job_opening_url(@job_opening), as: :json
    assert_response :success
  end

  test "should update job_opening" do
    patch job_opening_url(@job_opening), params: { job_opening: {  } }, as: :json
    assert_response :success
  end

  test "should destroy job_opening" do
    assert_difference("JobOpening.count", -1) do
      delete job_opening_url(@job_opening), as: :json
    end

    assert_response :no_content
  end
end
