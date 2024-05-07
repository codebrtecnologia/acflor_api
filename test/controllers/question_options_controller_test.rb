require "test_helper"

class QuestionOptionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @question_option = question_options(:one)
  end

  test "should get index" do
    get question_options_url, as: :json
    assert_response :success
  end

  test "should create question_option" do
    assert_difference("QuestionOption.count") do
      post question_options_url, params: { question_option: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show question_option" do
    get question_option_url(@question_option), as: :json
    assert_response :success
  end

  test "should update question_option" do
    patch question_option_url(@question_option), params: { question_option: {  } }, as: :json
    assert_response :success
  end

  test "should destroy question_option" do
    assert_difference("QuestionOption.count", -1) do
      delete question_option_url(@question_option), as: :json
    end

    assert_response :no_content
  end
end
