require "test_helper"

class EntityAddressesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @entity_address = entity_addresses(:one)
  end

  test "should get index" do
    get entity_addresses_url, as: :json
    assert_response :success
  end

  test "should create entity_address" do
    assert_difference("EntityAddress.count") do
      post entity_addresses_url, params: { entity_address: { city: @entity_address.city, entity_id: @entity_address.entity_id, neighborhood: @entity_address.neighborhood, street: @entity_address.street, zip_code: @entity_address.zip_code } }, as: :json
    end

    assert_response :created
  end

  test "should show entity_address" do
    get entity_address_url(@entity_address), as: :json
    assert_response :success
  end

  test "should update entity_address" do
    patch entity_address_url(@entity_address), params: { entity_address: { city: @entity_address.city, entity_id: @entity_address.entity_id, neighborhood: @entity_address.neighborhood, street: @entity_address.street, zip_code: @entity_address.zip_code } }, as: :json
    assert_response :success
  end

  test "should destroy entity_address" do
    assert_difference("EntityAddress.count", -1) do
      delete entity_address_url(@entity_address), as: :json
    end

    assert_response :no_content
  end
end
