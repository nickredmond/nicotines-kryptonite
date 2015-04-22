require 'test_helper'

class ForumControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get showthread" do
    get :showthread
    assert_response :success
  end

  test "should get reply" do
    get :reply
    assert_response :success
  end

  test "should get newthread" do
    get :newthread
    assert_response :success
  end

end
