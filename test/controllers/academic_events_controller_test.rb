require "test_helper"

class AcademicEventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @academic_event = academic_events(:one)
  end

  test "should get index" do
    get academic_events_url, as: :json
    assert_response :success
  end

  test "should create academic_event" do
    assert_difference("AcademicEvent.count") do
      post academic_events_url, params: { academic_event: { description: @academic_event.description, end_date: @academic_event.end_date, end_time: @academic_event.end_time, local: @academic_event.local, name: @academic_event.name, start_date: @academic_event.start_date, start_time: @academic_event.start_time } }, as: :json
    end

    assert_response :created
  end

  test "should show academic_event" do
    get academic_event_url(@academic_event), as: :json
    assert_response :success
  end

  test "should update academic_event" do
    patch academic_event_url(@academic_event), params: { academic_event: { description: @academic_event.description, end_date: @academic_event.end_date, end_time: @academic_event.end_time, local: @academic_event.local, name: @academic_event.name, start_date: @academic_event.start_date, start_time: @academic_event.start_time } }, as: :json
    assert_response :success
  end

  test "should destroy academic_event" do
    assert_difference("AcademicEvent.count", -1) do
      delete academic_event_url(@academic_event), as: :json
    end

    assert_response :no_content
  end
end
