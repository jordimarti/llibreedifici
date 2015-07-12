require 'test_helper'

class SanejamentsControllerTest < ActionController::TestCase
  setup do
    @sanejament = sanejaments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sanejaments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sanejament" do
    assert_difference('Sanejament.count') do
      post :create, sanejament: { baixants_alumini: @sanejament.baixants_alumini, baixants_ceramics: @sanejament.baixants_ceramics, baixants_coure: @sanejament.baixants_coure, baixants_encastats: @sanejament.baixants_encastats, baixants_fibrociment: @sanejament.baixants_fibrociment, baixants_polipropile: @sanejament.baixants_polipropile, baixants_pvc: @sanejament.baixants_pvc, baixants_vistos: @sanejament.baixants_vistos, baixants_zinc: @sanejament.baixants_zinc, bomba_elevacio: @sanejament.bomba_elevacio, colectors_ceramic: @sanejament.colectors_ceramic, colectors_fibrociment: @sanejament.colectors_fibrociment, colectors_formigo: @sanejament.colectors_formigo, colectors_pvc: @sanejament.colectors_pvc, colectors_vistos: @sanejament.colectors_vistos, fosa_septica: @sanejament.fosa_septica, no_sistema_evacuacio: @sanejament.no_sistema_evacuacio, separador_greixos: @sanejament.separador_greixos, si_sistema_evacuacio: @sanejament.si_sistema_evacuacio }
    end

    assert_redirected_to sanejament_path(assigns(:sanejament))
  end

  test "should show sanejament" do
    get :show, id: @sanejament
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sanejament
    assert_response :success
  end

  test "should update sanejament" do
    patch :update, id: @sanejament, sanejament: { baixants_alumini: @sanejament.baixants_alumini, baixants_ceramics: @sanejament.baixants_ceramics, baixants_coure: @sanejament.baixants_coure, baixants_encastats: @sanejament.baixants_encastats, baixants_fibrociment: @sanejament.baixants_fibrociment, baixants_polipropile: @sanejament.baixants_polipropile, baixants_pvc: @sanejament.baixants_pvc, baixants_vistos: @sanejament.baixants_vistos, baixants_zinc: @sanejament.baixants_zinc, bomba_elevacio: @sanejament.bomba_elevacio, colectors_ceramic: @sanejament.colectors_ceramic, colectors_fibrociment: @sanejament.colectors_fibrociment, colectors_formigo: @sanejament.colectors_formigo, colectors_pvc: @sanejament.colectors_pvc, colectors_vistos: @sanejament.colectors_vistos, fosa_septica: @sanejament.fosa_septica, no_sistema_evacuacio: @sanejament.no_sistema_evacuacio, separador_greixos: @sanejament.separador_greixos, si_sistema_evacuacio: @sanejament.si_sistema_evacuacio }
    assert_redirected_to sanejament_path(assigns(:sanejament))
  end

  test "should destroy sanejament" do
    assert_difference('Sanejament.count', -1) do
      delete :destroy, id: @sanejament
    end

    assert_redirected_to sanejaments_path
  end
end
