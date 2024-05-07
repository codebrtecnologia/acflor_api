require "test_helper"

class ModuleExamsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @module_exam = module_exams(:one)
  end

  test "should get index" do
    get module_exams_url, as: :json
    assert_response :success
  end

  test "should create module_exam" do
    assert_difference("ModuleExam.count") do
      post module_exams_url, params: { module_exam: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show module_exam" do
    get module_exam_url(@module_exam), as: :json
    assert_response :success
  end

  test "should update module_exam" do
    patch module_exam_url(@module_exam), params: { module_exam: {  } }, as: :json
    assert_response :success
  end

  test "should destroy module_exam" do
    assert_difference("ModuleExam.count", -1) do
      delete module_exam_url(@module_exam), as: :json
    end

    assert_response :no_content
  end
end
