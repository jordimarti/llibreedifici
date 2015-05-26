require 'test_helper'

class ProjectistesControllerTest < ActionController::TestCase
  setup do
    @projectista = projectistes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:projectistes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create projectista" do
    assert_difference('Projectista.count') do
      post :create, projectista: { edifici_id: @projectista.edifici_id, nif_projectista: @projectista.nif_projectista, nom_projectista: @projectista.nom_projectista, rao_social_projectista: @projectista.rao_social_projectista, titulacio_projectista: @projectista.titulacio_projectista }
    end

    assert_redirected_to projectista_path(assigns(:projectista))
  end

  test "should show projectista" do
    get :show, id: @projectista
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @projectista
    assert_response :success
  end

  test "should update projectista" do
    patch :update, id: @projectista, projectista: { edifici_id: @projectista.edifici_id, nif_projectista: @projectista.nif_projectista, nom_projectista: @projectista.nom_projectista, rao_social_projectista: @projectista.rao_social_projectista, titulacio_projectista: @projectista.titulacio_projectista }
    assert_redirected_to projectista_path(assigns(:projectista))
  end

  test "should destroy projectista" do
    assert_difference('Projectista.count', -1) do
      delete :destroy, id: @projectista
    end

    assert_redirected_to projectistes_path
  end
end
