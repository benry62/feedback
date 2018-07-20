require 'test_helper'

class PresentationItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @presentation_item = presentation_items(:one)
  end

  test "should get index" do
    get presentation_items_url
    assert_response :success
  end

  test "should get new" do
    get new_presentation_item_url
    assert_response :success
  end

  test "should create presentation_item" do
    assert_difference('PresentationItem.count') do
      post presentation_items_url, params: { presentation_item: { category: @presentation_item.category } }
    end

    assert_redirected_to presentation_item_url(PresentationItem.last)
  end

  test "should show presentation_item" do
    get presentation_item_url(@presentation_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_presentation_item_url(@presentation_item)
    assert_response :success
  end

  test "should update presentation_item" do
    patch presentation_item_url(@presentation_item), params: { presentation_item: { category: @presentation_item.category } }
    assert_redirected_to presentation_item_url(@presentation_item)
  end

  test "should destroy presentation_item" do
    assert_difference('PresentationItem.count', -1) do
      delete presentation_item_url(@presentation_item)
    end

    assert_redirected_to presentation_items_url
  end
end
