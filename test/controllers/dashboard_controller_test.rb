require 'test_helper'

class DashboardControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get milestones" do
    get :milestones
    assert_response :success
  end

  test "should get journal" do
    get :journal
    assert_response :success
  end

  test "should get whyquit" do
    get :whyquit
    assert_response :success
  end

end
