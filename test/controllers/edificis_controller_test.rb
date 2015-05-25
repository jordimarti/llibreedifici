require 'test_helper'

class EdificisControllerTest < ActionController::TestCase
  setup do
    @edifici = edificis(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:edificis)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create edifici" do
    assert_difference('Edifici.count') do
      post :create, edifici: { nom: @edifici.nom, user_id: @edifici.user_id }
    end

    assert_redirected_to edifici_path(assigns(:edifici))
  end

  test "should show edifici" do
    get :show, id: @edifici
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @edifici
    assert_response :success
  end

  test "should update edifici" do
    patch :update, id: @edifici, edifici: { nom: @edifici.nom, user_id: @edifici.user_id }
    assert_redirected_to edifici_path(assigns(:edifici))
  end

  test "should destroy edifici" do
    assert_difference('Edifici.count', -1) do
      delete :destroy, id: @edifici
    end

    assert_redirected_to edificis_path
  end
end
