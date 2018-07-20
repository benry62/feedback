require "application_system_test_case"

class ClassGroupsTest < ApplicationSystemTestCase
  setup do
    @class_group = class_groups(:one)
  end

  test "visiting the index" do
    visit class_groups_url
    assert_selector "h1", text: "Class Groups"
  end

  test "creating a Class group" do
    visit class_groups_url
    click_on "New Class Group"

    fill_in "Name", with: @class_group.name
    fill_in "Number In Class", with: @class_group.number_in_class
    fill_in "Year", with: @class_group.year
    click_on "Create Class group"

    assert_text "Class group was successfully created"
    click_on "Back"
  end

  test "updating a Class group" do
    visit class_groups_url
    click_on "Edit", match: :first

    fill_in "Name", with: @class_group.name
    fill_in "Number In Class", with: @class_group.number_in_class
    fill_in "Year", with: @class_group.year
    click_on "Update Class group"

    assert_text "Class group was successfully updated"
    click_on "Back"
  end

  test "destroying a Class group" do
    visit class_groups_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Class group was successfully destroyed"
  end
end
