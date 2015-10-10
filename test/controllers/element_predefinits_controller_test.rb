require 'test_helper'

class ElementPredefinitsControllerTest < ActionController::TestCase
  setup do
    @element_predefinit = element_predefinits(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:element_predefinits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create element_predefinit" do
    assert_difference('ElementPredefinit.count') do
      post :create, element_predefinit: { descripcio_ca: @element_predefinit.descripcio_ca, descripcio_es: @element_predefinit.descripcio_es, nom_element: @element_predefinit.nom_element, sistema_element: @element_predefinit.sistema_element }
    end

    assert_redirected_to element_predefinit_path(assigns(:element_predefinit))
  end

  test "should show element_predefinit" do
    get :show, id: @element_predefinit
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @element_predefinit
    assert_response :success
  end

  test "should update element_predefinit" do
    patch :update, id: @element_predefinit, element_predefinit: { descripcio_ca: @element_predefinit.descripcio_ca, descripcio_es: @element_predefinit.descripcio_es, nom_element: @element_predefinit.nom_element, sistema_element: @element_predefinit.sistema_element }
    assert_redirected_to element_predefinit_path(assigns(:element_predefinit))
  end

  test "should destroy element_predefinit" do
    assert_difference('ElementPredefinit.count', -1) do
      delete :destroy, id: @element_predefinit
    end

    assert_redirected_to element_predefinits_path
  end
end
