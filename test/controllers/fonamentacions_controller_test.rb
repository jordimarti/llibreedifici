require 'test_helper'

class FonamentacionsControllerTest < ActionController::TestCase
  setup do
    @fonamentacio = fonamentacions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fonamentacions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fonamentacio" do
    assert_difference('Fonamentacio.count') do
      post :create, fonamentacio: { edifici_id: @fonamentacio.edifici_id, llosa: @fonamentacio.llosa, mur_fabrica_bloc: @fonamentacio.mur_fabrica_bloc, mur_fabrica_mao: @fonamentacio.mur_fabrica_mao, mur_formigo_armat: @fonamentacio.mur_formigo_armat, mur_pantalla: @fonamentacio.mur_pantalla, mur_pedra: @fonamentacio.mur_pedra, pantalles: @fonamentacio.pantalles, pilons: @fonamentacio.pilons, sabates_formigo: @fonamentacio.sabates_formigo, sabates_paredat: @fonamentacio.sabates_paredat }
    end

    assert_redirected_to fonamentacio_path(assigns(:fonamentacio))
  end

  test "should show fonamentacio" do
    get :show, id: @fonamentacio
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fonamentacio
    assert_response :success
  end

  test "should update fonamentacio" do
    patch :update, id: @fonamentacio, fonamentacio: { edifici_id: @fonamentacio.edifici_id, llosa: @fonamentacio.llosa, mur_fabrica_bloc: @fonamentacio.mur_fabrica_bloc, mur_fabrica_mao: @fonamentacio.mur_fabrica_mao, mur_formigo_armat: @fonamentacio.mur_formigo_armat, mur_pantalla: @fonamentacio.mur_pantalla, mur_pedra: @fonamentacio.mur_pedra, pantalles: @fonamentacio.pantalles, pilons: @fonamentacio.pilons, sabates_formigo: @fonamentacio.sabates_formigo, sabates_paredat: @fonamentacio.sabates_paredat }
    assert_redirected_to fonamentacio_path(assigns(:fonamentacio))
  end

  test "should destroy fonamentacio" do
    assert_difference('Fonamentacio.count', -1) do
      delete :destroy, id: @fonamentacio
    end

    assert_redirected_to fonamentacions_path
  end
end
