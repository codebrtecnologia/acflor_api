require "test_helper"

class ExamAnswersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @exam_answer = exam_answers(:one)
  end

  test "should get index" do
    get exam_answers_url, as: :json
    assert_response :success
  end

  test "should create exam_answer" do
    assert_difference("ExamAnswer.count") do
      post exam_answers_url, params: { exam_answer: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show exam_answer" do
    get exam_answer_url(@exam_answer), as: :json
    assert_response :success
  end

  test "should update exam_answer" do
    patch exam_answer_url(@exam_answer), params: { exam_answer: {  } }, as: :json
    assert_response :success
  end

  test "should destroy exam_answer" do
    assert_difference("ExamAnswer.count", -1) do
      delete exam_answer_url(@exam_answer), as: :json
    end

    assert_response :no_content
  end
end
