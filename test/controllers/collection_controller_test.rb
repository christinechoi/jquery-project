require 'test_helper'

class CollectionControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get collection_index_url
    assert_response :success
  end

  test "should get new" do
    get collection_new_url
    assert_response :success
  end

  test "should get create" do
    get collection_create_url
    assert_response :success
  end

  test "should get show" do
    get collection_show_url
    assert_response :success
  end

  test "should get edit" do
    get collection_edit_url
    assert_response :success
  end

  test "should get update" do
    get collection_update_url
    assert_response :success
  end

  test "should get destroy" do
    get collection_destroy_url
    assert_response :success
  end

end
