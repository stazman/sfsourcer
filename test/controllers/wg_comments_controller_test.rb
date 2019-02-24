require 'test_helper'

class WgCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get wg_comments_index_url
    assert_response :success
  end

  test "should get new" do
    get wg_comments_new_url
    assert_response :success
  end

  test "should get create" do
    get wg_comments_create_url
    assert_response :success
  end

  test "should get show" do
    get wg_comments_show_url
    assert_response :success
  end

  test "should get edit" do
    get wg_comments_edit_url
    assert_response :success
  end

  test "should get update" do
    get wg_comments_update_url
    assert_response :success
  end

  test "should get delete" do
    get wg_comments_delete_url
    assert_response :success
  end

end
