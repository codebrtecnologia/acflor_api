require "test_helper"

class ExamQuestionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @exam_question = exam_questions(:one)
  end

  test "should get index" do
    get exam_questions_url, as: :json
    assert_response :success
  end

  test "should create exam_question" do
    assert_difference("ExamQuestion.count") do
      post exam_questions_url, params: { exam_question: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show exam_question" do
    get exam_question_url(@exam_question), as: :json
    assert_response :success
  end

  test "should update exam_question" do
    patch exam_question_url(@exam_question), params: { exam_question: {  } }, as: :json
    assert_response :success
  end

  test "should destroy exam_question" do
    assert_difference("ExamQuestion.count", -1) do
      delete exam_question_url(@exam_question), as: :json
    end

    assert_response :no_content
  end
end
