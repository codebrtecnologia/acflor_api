require "test_helper"

class UsefulLinksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @useful_link = useful_links(:one)
  end

  test "should get index" do
    get useful_links_url, as: :json
    assert_response :success
  end

  test "should create useful_link" do
    assert_difference("UsefulLink.count") do
      post useful_links_url, params: { useful_link: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show useful_link" do
    get useful_link_url(@useful_link), as: :json
    assert_response :success
  end

  test "should update useful_link" do
    patch useful_link_url(@useful_link), params: { useful_link: {  } }, as: :json
    assert_response :success
  end

  test "should destroy useful_link" do
    assert_difference("UsefulLink.count", -1) do
      delete useful_link_url(@useful_link), as: :json
    end

    assert_response :no_content
  end
end
