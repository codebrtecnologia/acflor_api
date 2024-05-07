require "test_helper"

class UsefulLinkViewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @useful_link_view = useful_link_views(:one)
  end

  test "should get index" do
    get useful_link_views_url, as: :json
    assert_response :success
  end

  test "should create useful_link_view" do
    assert_difference("UsefulLinkView.count") do
      post useful_link_views_url, params: { useful_link_view: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show useful_link_view" do
    get useful_link_view_url(@useful_link_view), as: :json
    assert_response :success
  end

  test "should update useful_link_view" do
    patch useful_link_view_url(@useful_link_view), params: { useful_link_view: {  } }, as: :json
    assert_response :success
  end

  test "should destroy useful_link_view" do
    assert_difference("UsefulLinkView.count", -1) do
      delete useful_link_view_url(@useful_link_view), as: :json
    end

    assert_response :no_content
  end
end
