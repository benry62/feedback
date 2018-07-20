require "application_system_test_case"

class PresentationItemsTest < ApplicationSystemTestCase
  setup do
    @presentation_item = presentation_items(:one)
  end

  test "visiting the index" do
    visit presentation_items_url
    assert_selector "h1", text: "Presentation Items"
  end

  test "creating a Presentation item" do
    visit presentation_items_url
    click_on "New Presentation Item"

    fill_in "Category", with: @presentation_item.category
    click_on "Create Presentation item"

    assert_text "Presentation item was successfully created"
    click_on "Back"
  end

  test "updating a Presentation item" do
    visit presentation_items_url
    click_on "Edit", match: :first

    fill_in "Category", with: @presentation_item.category
    click_on "Update Presentation item"

    assert_text "Presentation item was successfully updated"
    click_on "Back"
  end

  test "destroying a Presentation item" do
    visit presentation_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Presentation item was successfully destroyed"
  end
end
