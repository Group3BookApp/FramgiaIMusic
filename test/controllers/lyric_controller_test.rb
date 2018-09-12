require 'test_helper'

class LyricControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get lyric_create_url
    assert_response :success
  end

  test "should get show" do
    get lyric_show_url
    assert_response :success
  end

  test "should get edit" do
    get lyric_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get lyric_destroy_url
    assert_response :success
  end

end
