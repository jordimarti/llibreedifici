require 'test_helper'

class EntitatsControllerTest < ActionController::TestCase
  setup do
    @entitat = entitats(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:entitats)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create entitat" do
    assert_difference('Entitat.count') do
      post :create, entitat: { destinacio: @entitat.destinacio, edifici_id: @entitat.edifici_id, nom_entitat: @entitat.nom_entitat, quota: @entitat.quota, superficie: @entitat.superficie }
    end

    assert_redirected_to entitat_path(assigns(:entitat))
  end

  test "should show entitat" do
    get :show, id: @entitat
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @entitat
    assert_response :success
  end

  test "should update entitat" do
    patch :update, id: @entitat, entitat: { destinacio: @entitat.destinacio, edifici_id: @entitat.edifici_id, nom_entitat: @entitat.nom_entitat, quota: @entitat.quota, superficie: @entitat.superficie }
    assert_redirected_to entitat_path(assigns(:entitat))
  end

  test "should destroy entitat" do
    assert_difference('Entitat.count', -1) do
      delete :destroy, id: @entitat
    end

    assert_redirected_to entitats_path
  end
end
