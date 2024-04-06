require "application_system_test_case"

class LinksTest < ApplicationSystemTestCase
  setup do
    @link = links(:one)
  end

  test "visiting the index" do
    visit links_url
    assert_selector "h1", text: "Links"
  end

  test "should create link" do
    visit links_url
    click_on "New link"

    fill_in "Page", with: @link.page_id
    fill_in "Source", with: @link.source
    fill_in "Title", with: @link.title
    fill_in "Views", with: @link.views
    click_on "Create Link"

    assert_text "Link was successfully created"
    click_on "Back"
  end

  test "should update Link" do
    visit page_link_url(@link)
    click_on "Edit this link", match: :first

    fill_in "Page", with: @link.page_id
    fill_in "Source", with: @link.source
    fill_in "Title", with: @link.title
    fill_in "Views", with: @link.views
    click_on "Update Link"

    assert_text "Link was successfully updated"
    click_on "Back"
  end

  test "should destroy Link" do
    visit page_link_url(@link)
    click_on "Destroy this link", match: :first

    assert_text "Link was successfully destroyed"
  end
end
