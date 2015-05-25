require 'test_helper'

class LaboratorisControllerTest < ActionController::TestCase
  setup do
    @laboratori = laboratoris(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:laboratoris)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create laboratori" do
    assert_difference('Laboratori.count') do
      post :create, laboratori: { edifici_id: @laboratori.edifici_id, nif_laboratori: @laboratori.nif_laboratori, nom_laboratori: @laboratori.nom_laboratori }
    end

    assert_redirected_to laboratori_path(assigns(:laboratori))
  end

  test "should show laboratori" do
    get :show, id: @laboratori
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @laboratori
    assert_response :success
  end

  test "should update laboratori" do
    patch :update, id: @laboratori, laboratori: { edifici_id: @laboratori.edifici_id, nif_laboratori: @laboratori.nif_laboratori, nom_laboratori: @laboratori.nom_laboratori }
    assert_redirected_to laboratori_path(assigns(:laboratori))
  end

  test "should destroy laboratori" do
    assert_difference('Laboratori.count', -1) do
      delete :destroy, id: @laboratori
    end

    assert_redirected_to laboratoris_path
  end
end
