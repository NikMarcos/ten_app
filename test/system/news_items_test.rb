require "application_system_test_case"

class NewsItemsTest < ApplicationSystemTestCase
  setup do
    @news_item = news_items(:one)
  end

  test "visiting the index" do
    visit news_items_url
    assert_selector "h1", text: "News Items"
  end

  test "creating a News item" do
    visit news_items_url
    click_on "New News Item"

    fill_in "Body", with: @news_item.body
    fill_in "Cover", with: @news_item.cover
    fill_in "News category", with: @news_item.news_category
    fill_in "Title", with: @news_item.title
    click_on "Create News item"

    assert_text "News item was successfully created"
    click_on "Back"
  end

  test "updating a News item" do
    visit news_items_url
    click_on "Edit", match: :first

    fill_in "Body", with: @news_item.body
    fill_in "Cover", with: @news_item.cover
    fill_in "News category", with: @news_item.news_category
    fill_in "Title", with: @news_item.title
    click_on "Update News item"

    assert_text "News item was successfully updated"
    click_on "Back"
  end

  test "destroying a News item" do
    visit news_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "News item was successfully destroyed"
  end
end
