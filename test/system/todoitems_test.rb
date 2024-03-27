require "application_system_test_case"

class TodoitemsTest < ApplicationSystemTestCase
  setup do
    @todoitem = todoitems(:one)
  end

  test "visiting the index" do
    visit todoitems_url
    assert_selector "h1", text: "Todoitems"
  end

  test "should create todoitem" do
    visit todoitems_url
    click_on "New todoitem"

    check "Completed" if @todoitem.completed
    fill_in "Deadline", with: @todoitem.deadline
    fill_in "Description", with: @todoitem.description
    fill_in "Name", with: @todoitem.name
    click_on "Create Todoitem"

    assert_text "Todoitem was successfully created"
    click_on "Back"
  end

  test "should update Todoitem" do
    visit todoitem_url(@todoitem)
    click_on "Edit this todoitem", match: :first

    check "Completed" if @todoitem.completed
    fill_in "Deadline", with: @todoitem.deadline
    fill_in "Description", with: @todoitem.description
    fill_in "Name", with: @todoitem.name
    click_on "Update Todoitem"

    assert_text "Todoitem was successfully updated"
    click_on "Back"
  end

  test "should destroy Todoitem" do
    visit todoitem_url(@todoitem)
    click_on "Destroy this todoitem", match: :first

    assert_text "Todoitem was successfully destroyed"
  end
end
