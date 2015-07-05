require 'test_helper'

class CobertesControllerTest < ActionController::TestCase
  setup do
    @coberta = cobertes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cobertes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create coberta" do
    assert_difference('Coberta.count') do
      post :create, coberta: { coberta_aillament_termic: @coberta.coberta_aillament_termic, coberta_asfaltica: @coberta.coberta_asfaltica, coberta_fibrociment: @coberta.coberta_fibrociment, coberta_pissarra: @coberta.coberta_pissarra, coberta_teula_arab: @coberta.coberta_teula_arab, coberta_teula_ciment: @coberta.coberta_teula_ciment, coberta_teula_plana: @coberta.coberta_teula_plana, coberta_xapa_acer: @coberta.coberta_xapa_acer, coberta_xapa_coure: @coberta.coberta_xapa_coure, edifici_id: @coberta.edifici_id, terrat_aillament_termic: @coberta.terrat_aillament_termic, terrat_lamina_impermeabilitzant: @coberta.terrat_lamina_impermeabilitzant, terrat_no_transitable: @coberta.terrat_no_transitable, terrat_transitable: @coberta.terrat_transitable }
    end

    assert_redirected_to coberta_path(assigns(:coberta))
  end

  test "should show coberta" do
    get :show, id: @coberta
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @coberta
    assert_response :success
  end

  test "should update coberta" do
    patch :update, id: @coberta, coberta: { coberta_aillament_termic: @coberta.coberta_aillament_termic, coberta_asfaltica: @coberta.coberta_asfaltica, coberta_fibrociment: @coberta.coberta_fibrociment, coberta_pissarra: @coberta.coberta_pissarra, coberta_teula_arab: @coberta.coberta_teula_arab, coberta_teula_ciment: @coberta.coberta_teula_ciment, coberta_teula_plana: @coberta.coberta_teula_plana, coberta_xapa_acer: @coberta.coberta_xapa_acer, coberta_xapa_coure: @coberta.coberta_xapa_coure, edifici_id: @coberta.edifici_id, terrat_aillament_termic: @coberta.terrat_aillament_termic, terrat_lamina_impermeabilitzant: @coberta.terrat_lamina_impermeabilitzant, terrat_no_transitable: @coberta.terrat_no_transitable, terrat_transitable: @coberta.terrat_transitable }
    assert_redirected_to coberta_path(assigns(:coberta))
  end

  test "should destroy coberta" do
    assert_difference('Coberta.count', -1) do
      delete :destroy, id: @coberta
    end

    assert_redirected_to cobertes_path
  end
end
