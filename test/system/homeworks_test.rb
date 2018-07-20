require "application_system_test_case"

class HomeworksTest < ApplicationSystemTestCase
  setup do
    @homework = homeworks(:one)
  end

  test "visiting the index" do
    visit homeworks_url
    assert_selector "h1", text: "Homeworks"
  end

  test "creating a Homework" do
    visit homeworks_url
    click_on "New Homework"

    fill_in "Class Group", with: @homework.class_group_id
    fill_in "Date", with: @homework.date
    fill_in "Title", with: @homework.title
    click_on "Create Homework"

    assert_text "Homework was successfully created"
    click_on "Back"
  end

  test "updating a Homework" do
    visit homeworks_url
    click_on "Edit", match: :first

    fill_in "Class Group", with: @homework.class_group_id
    fill_in "Date", with: @homework.date
    fill_in "Title", with: @homework.title
    click_on "Update Homework"

    assert_text "Homework was successfully updated"
    click_on "Back"
  end

  test "destroying a Homework" do
    visit homeworks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Homework was successfully destroyed"
  end
end
