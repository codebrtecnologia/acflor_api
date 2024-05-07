require "test_helper"

class NewsletterViewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @newsletter_view = newsletter_views(:one)
  end

  test "should get index" do
    get newsletter_views_url, as: :json
    assert_response :success
  end

  test "should create newsletter_view" do
    assert_difference("NewsletterView.count") do
      post newsletter_views_url, params: { newsletter_view: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show newsletter_view" do
    get newsletter_view_url(@newsletter_view), as: :json
    assert_response :success
  end

  test "should update newsletter_view" do
    patch newsletter_view_url(@newsletter_view), params: { newsletter_view: {  } }, as: :json
    assert_response :success
  end

  test "should destroy newsletter_view" do
    assert_difference("NewsletterView.count", -1) do
      delete newsletter_view_url(@newsletter_view), as: :json
    end

    assert_response :no_content
  end
end
