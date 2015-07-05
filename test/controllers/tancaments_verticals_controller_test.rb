require 'test_helper'

class TancamentsVerticalsControllerTest < ActionController::TestCase
  setup do
    @tancaments_vertical = tancaments_verticals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tancaments_verticals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tancaments_vertical" do
    assert_difference('TancamentsVertical.count') do
      post :create, tancaments_vertical: { acabat_revestit_aplacat_ceramic: @tancaments_vertical.acabat_revestit_aplacat_ceramic, acabat_revestit_aplacat_pedra: @tancaments_vertical.acabat_revestit_aplacat_pedra, acabat_revestit_arrebossat_pintat: @tancaments_vertical.acabat_revestit_arrebossat_pintat, acabat_revestit_estucat: @tancaments_vertical.acabat_revestit_estucat, acabat_revestit_morter_monocapa: @tancaments_vertical.acabat_revestit_morter_monocapa, acabat_revestit_xapa_metalica: @tancaments_vertical.acabat_revestit_xapa_metalica, acabat_vist_bloc_formigo: @tancaments_vertical.acabat_vist_bloc_formigo, acabat_vist_carreus: @tancaments_vertical.acabat_vist_carreus, acabat_vist_fabrica_bloc_ceramic: @tancaments_vertical.acabat_vist_fabrica_bloc_ceramic, acabat_vist_fabrica_mao: @tancaments_vertical.acabat_vist_fabrica_mao, acabat_vist_panell_formigo: @tancaments_vertical.acabat_vist_panell_formigo, acabat_vist_panell_metalic_sandwich: @tancaments_vertical.acabat_vist_panell_metalic_sandwich, acabat_vist_paredat: @tancaments_vertical.acabat_vist_paredat, cambra_aire_facana: @tancaments_vertical.cambra_aire_facana, edifici_id: @tancaments_vertical.edifici_id, fusteria_acer: @tancaments_vertical.fusteria_acer, fusteria_alumini: @tancaments_vertical.fusteria_alumini, fusteria_fusta: @tancaments_vertical.fusteria_fusta, fusteria_pvc: @tancaments_vertical.fusteria_pvc, vidre_baix_emissiu: @tancaments_vertical.vidre_baix_emissiu, vidre_control_solar: @tancaments_vertical.vidre_control_solar, vidre_doble: @tancaments_vertical.vidre_doble, vidre_simple: @tancaments_vertical.vidre_simple, vidre_triple: @tancaments_vertical.vidre_triple }
    end

    assert_redirected_to tancaments_vertical_path(assigns(:tancaments_vertical))
  end

  test "should show tancaments_vertical" do
    get :show, id: @tancaments_vertical
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tancaments_vertical
    assert_response :success
  end

  test "should update tancaments_vertical" do
    patch :update, id: @tancaments_vertical, tancaments_vertical: { acabat_revestit_aplacat_ceramic: @tancaments_vertical.acabat_revestit_aplacat_ceramic, acabat_revestit_aplacat_pedra: @tancaments_vertical.acabat_revestit_aplacat_pedra, acabat_revestit_arrebossat_pintat: @tancaments_vertical.acabat_revestit_arrebossat_pintat, acabat_revestit_estucat: @tancaments_vertical.acabat_revestit_estucat, acabat_revestit_morter_monocapa: @tancaments_vertical.acabat_revestit_morter_monocapa, acabat_revestit_xapa_metalica: @tancaments_vertical.acabat_revestit_xapa_metalica, acabat_vist_bloc_formigo: @tancaments_vertical.acabat_vist_bloc_formigo, acabat_vist_carreus: @tancaments_vertical.acabat_vist_carreus, acabat_vist_fabrica_bloc_ceramic: @tancaments_vertical.acabat_vist_fabrica_bloc_ceramic, acabat_vist_fabrica_mao: @tancaments_vertical.acabat_vist_fabrica_mao, acabat_vist_panell_formigo: @tancaments_vertical.acabat_vist_panell_formigo, acabat_vist_panell_metalic_sandwich: @tancaments_vertical.acabat_vist_panell_metalic_sandwich, acabat_vist_paredat: @tancaments_vertical.acabat_vist_paredat, cambra_aire_facana: @tancaments_vertical.cambra_aire_facana, edifici_id: @tancaments_vertical.edifici_id, fusteria_acer: @tancaments_vertical.fusteria_acer, fusteria_alumini: @tancaments_vertical.fusteria_alumini, fusteria_fusta: @tancaments_vertical.fusteria_fusta, fusteria_pvc: @tancaments_vertical.fusteria_pvc, vidre_baix_emissiu: @tancaments_vertical.vidre_baix_emissiu, vidre_control_solar: @tancaments_vertical.vidre_control_solar, vidre_doble: @tancaments_vertical.vidre_doble, vidre_simple: @tancaments_vertical.vidre_simple, vidre_triple: @tancaments_vertical.vidre_triple }
    assert_redirected_to tancaments_vertical_path(assigns(:tancaments_vertical))
  end

  test "should destroy tancaments_vertical" do
    assert_difference('TancamentsVertical.count', -1) do
      delete :destroy, id: @tancaments_vertical
    end

    assert_redirected_to tancaments_verticals_path
  end
end
