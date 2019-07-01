require 'test_helper'

class AreasControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get areas_new_url
    assert_response :success
  end

  test "should get create" do
    get areas_create_url
    assert_response :success
  end

  test "should get update" do
    get areas_update_url
    assert_response :success
  end

  test "should get edit" do
    get areas_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get areas_destroy_url
    assert_response :success
  end

  test "should get show" do
    get areas_show_url
    assert_response :success
  end

  test "should get index" do
    get areas_index_url
    assert_response :success
  end

end
