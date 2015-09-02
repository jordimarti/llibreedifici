require 'test_helper'

class DadesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
