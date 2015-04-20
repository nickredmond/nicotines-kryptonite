require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get facts" do
    get :facts
    assert_response :success
  end

  test "should get resources" do
    get :resources
    assert_response :success
  end

  test "should get whyquit" do
    get :whyquit
    assert_response :success
  end

  test "should get signup" do
    get :signup
    assert_response :success
  end

  test "should get features" do
    get :features
    assert_response :success
  end

end
