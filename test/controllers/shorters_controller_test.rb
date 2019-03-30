require 'test_helper'

class ShortersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shorter = shorters(:one)
  end

  test "should get index" do
    get shorters_url
    assert_response :success
  end

  test "should get new" do
    get new_shorter_url
    assert_response :success
  end

  test "should create shorter" do
    assert_difference('Shorter.count') do
      post shorters_url, params: { shorter: { expire_time: @shorter.expire_time, original_url: @shorter.original_url, redirect_counter: @shorter.redirect_counter, shorted_url: @shorter.shorted_url } }
    end

    assert_redirected_to shorter_url(Shorter.last)
  end

  test "should show shorter" do
    get shorter_url(@shorter)
    assert_response :success
  end

  test "should get edit" do
    get edit_shorter_url(@shorter)
    assert_response :success
  end

  test "should update shorter" do
    patch shorter_url(@shorter), params: { shorter: { expire_time: @shorter.expire_time, original_url: @shorter.original_url, redirect_counter: @shorter.redirect_counter, shorted_url: @shorter.shorted_url } }
    assert_redirected_to shorter_url(@shorter)
  end

  test "should destroy shorter" do
    assert_difference('Shorter.count', -1) do
      delete shorter_url(@shorter)
    end

    assert_redirected_to shorters_url
  end
end
