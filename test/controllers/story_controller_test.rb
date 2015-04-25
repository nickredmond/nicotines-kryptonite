require 'test_helper'

class StoryControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get viewstory" do
    get :viewstory
    assert_response :success
  end

  test "should get viewpage" do
    get :viewpage
    assert_response :success
  end

end
