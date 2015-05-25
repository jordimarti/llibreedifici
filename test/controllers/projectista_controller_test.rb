require 'test_helper'

class ProjectistaControllerTest < ActionController::TestCase
  setup do
    @projectistum = projectista(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:projectista)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create projectistum" do
    assert_difference('Projectistum.count') do
      post :create, projectistum: { edifici_id: @projectistum.edifici_id, nif_projectista: @projectistum.nif_projectista, nom_projectista: @projectistum.nom_projectista, rao_social_projectista: @projectistum.rao_social_projectista, titulacio_projectista: @projectistum.titulacio_projectista }
    end

    assert_redirected_to projectistum_path(assigns(:projectistum))
  end

  test "should show projectistum" do
    get :show, id: @projectistum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @projectistum
    assert_response :success
  end

  test "should update projectistum" do
    patch :update, id: @projectistum, projectistum: { edifici_id: @projectistum.edifici_id, nif_projectista: @projectistum.nif_projectista, nom_projectista: @projectistum.nom_projectista, rao_social_projectista: @projectistum.rao_social_projectista, titulacio_projectista: @projectistum.titulacio_projectista }
    assert_redirected_to projectistum_path(assigns(:projectistum))
  end

  test "should destroy projectistum" do
    assert_difference('Projectistum.count', -1) do
      delete :destroy, id: @projectistum
    end

    assert_redirected_to projectista_path
  end
end
