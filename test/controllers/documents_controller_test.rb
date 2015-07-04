require 'test_helper'

class DocumentsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get quadern" do
    get :quadern
    assert_response :success
  end

  test "should get det" do
    get :det
    assert_response :success
  end

  test "should get manual" do
    get :manual
    assert_response :success
  end

  test "should get arxiu" do
    get :arxiu
    assert_response :success
  end

end
