require "test_helper"

class LinksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @page = pages(:one)
    @link = links(:one)
    sign_in_as(users(:one))
  end

  test "should get index" do
    get page_links_url(@page.id)
    assert_response :success
  end

  test "should get new" do
    get new_page_link_url(@page.id)
    assert_response :success
  end

  test "should create link" do
    assert_difference("Link.count") do
      post page_links_url(@page.id), params: { link: { source: @link.source, title: @link.title } }
    end

    assert_redirected_to page_link_url(@page.id, Link.last.id)
  end

  test "should show link" do
    get page_link_url(@page.id, @link.page_id)
    assert_response :success
  end

  test "should get edit" do
    get edit_page_link_url(@page.id, @link.id)
    assert_response :success
  end

  test "should update link" do
    patch page_link_url(@page.id, @link.id), params: { link: { source: @link.source, title: @link.title, views: @link.views } }
    assert_redirected_to page_link_url(@page.id, @link.id)
  end

  test "should destroy link" do
    assert_difference("Link.count", -1) do
      delete page_link_url(@page.id, @link.id)
    end

    assert_redirected_to page_links_url(@page.id)
  end
end
