require "test_helper"

class EntitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @entity = entities(:one)
  end

  test "should get index" do
    get entities_url, as: :json
    assert_response :success
  end

  test "should create entity" do
    assert_difference("Entity.count") do
      post entities_url, params: { entity: { address: @entity.address, email: @entity.email, name: @entity.name, phone: @entity.phone, responsible: @entity.responsible } }, as: :json
    end

    assert_response :created
  end

  test "should show entity" do
    get entity_url(@entity), as: :json
    assert_response :success
  end

  test "should update entity" do
    patch entity_url(@entity), params: { entity: { address: @entity.address, email: @entity.email, name: @entity.name, phone: @entity.phone, responsible: @entity.responsible } }, as: :json
    assert_response :success
  end

  test "should destroy entity" do
    assert_difference("Entity.count", -1) do
      delete entity_url(@entity), as: :json
    end

    assert_response :no_content
  end
end
