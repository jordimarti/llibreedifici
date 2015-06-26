require 'test_helper'

class EstructuresControllerTest < ActionController::TestCase
  setup do
    @estructura = estructures(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:estructures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create estructura" do
    assert_difference('Estructura.count') do
      post :create, estructura: { bigues_formigo_armat: @estructura.bigues_formigo_armat, bigues_fusta: @estructura.bigues_fusta, bigues_metaliques: @estructura.bigues_metaliques, coberta_sandwich: @estructura.coberta_sandwich, coberta_taulell_ceramic: @estructura.coberta_taulell_ceramic, coberta_taulell_fusta: @estructura.coberta_taulell_fusta, edifici_id: @estructura.edifici_id, encavallada_bigues_formigo: @estructura.encavallada_bigues_formigo, encavallada_bigues_fusta: @estructura.encavallada_bigues_fusta, encavallada_bigues_metall: @estructura.encavallada_bigues_metall, entrebigat_revolto_ceramic: @estructura.entrebigat_revolto_ceramic, entrebigat_revolto_formigo: @estructura.entrebigat_revolto_formigo, entrebigat_taulell: @estructura.entrebigat_taulell, escala_ceramica: @estructura.escala_ceramica, escala_fusta: @estructura.escala_fusta, escala_llosa_armada: @estructura.escala_llosa_armada, escala_metall: @estructura.escala_metall, forjat_ceramica_armada: @estructura.forjat_ceramica_armada, forjat_formigo_armat: @estructura.forjat_formigo_armat, forjat_fusta: @estructura.forjat_fusta, forjat_horitzontal_coberta_capa_pendent: @estructura.forjat_horitzontal_coberta_capa_pendent, forjat_horitzontal_coberta_envanets: @estructura.forjat_horitzontal_coberta_envanets, forjat_inclinat_coberta_formigo: @estructura.forjat_inclinat_coberta_formigo, forjat_metalic: @estructura.forjat_metalic, forjat_reticular: @estructura.forjat_reticular, forjat_sanitari: @estructura.forjat_sanitari, llosa_formigo: @estructura.llosa_formigo, parets_bloc_ceramic: @estructura.parets_bloc_ceramic, parets_bloc_formigo: @estructura.parets_bloc_formigo, parets_entramat_fusta: @estructura.parets_entramat_fusta, parets_fabrica_mao: @estructura.parets_fabrica_mao, parets_formigo_armat: @estructura.parets_formigo_armat, parets_pedra: @estructura.parets_pedra, parets_tapia: @estructura.parets_tapia, parets_tova: @estructura.parets_tova, pilars_acer: @estructura.pilars_acer, pilars_ferro_colat: @estructura.pilars_ferro_colat, pilars_formigo_armat: @estructura.pilars_formigo_armat, pilars_mao: @estructura.pilars_mao, solera: @estructura.solera }
    end

    assert_redirected_to estructura_path(assigns(:estructura))
  end

  test "should show estructura" do
    get :show, id: @estructura
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @estructura
    assert_response :success
  end

  test "should update estructura" do
    patch :update, id: @estructura, estructura: { bigues_formigo_armat: @estructura.bigues_formigo_armat, bigues_fusta: @estructura.bigues_fusta, bigues_metaliques: @estructura.bigues_metaliques, coberta_sandwich: @estructura.coberta_sandwich, coberta_taulell_ceramic: @estructura.coberta_taulell_ceramic, coberta_taulell_fusta: @estructura.coberta_taulell_fusta, edifici_id: @estructura.edifici_id, encavallada_bigues_formigo: @estructura.encavallada_bigues_formigo, encavallada_bigues_fusta: @estructura.encavallada_bigues_fusta, encavallada_bigues_metall: @estructura.encavallada_bigues_metall, entrebigat_revolto_ceramic: @estructura.entrebigat_revolto_ceramic, entrebigat_revolto_formigo: @estructura.entrebigat_revolto_formigo, entrebigat_taulell: @estructura.entrebigat_taulell, escala_ceramica: @estructura.escala_ceramica, escala_fusta: @estructura.escala_fusta, escala_llosa_armada: @estructura.escala_llosa_armada, escala_metall: @estructura.escala_metall, forjat_ceramica_armada: @estructura.forjat_ceramica_armada, forjat_formigo_armat: @estructura.forjat_formigo_armat, forjat_fusta: @estructura.forjat_fusta, forjat_horitzontal_coberta_capa_pendent: @estructura.forjat_horitzontal_coberta_capa_pendent, forjat_horitzontal_coberta_envanets: @estructura.forjat_horitzontal_coberta_envanets, forjat_inclinat_coberta_formigo: @estructura.forjat_inclinat_coberta_formigo, forjat_metalic: @estructura.forjat_metalic, forjat_reticular: @estructura.forjat_reticular, forjat_sanitari: @estructura.forjat_sanitari, llosa_formigo: @estructura.llosa_formigo, parets_bloc_ceramic: @estructura.parets_bloc_ceramic, parets_bloc_formigo: @estructura.parets_bloc_formigo, parets_entramat_fusta: @estructura.parets_entramat_fusta, parets_fabrica_mao: @estructura.parets_fabrica_mao, parets_formigo_armat: @estructura.parets_formigo_armat, parets_pedra: @estructura.parets_pedra, parets_tapia: @estructura.parets_tapia, parets_tova: @estructura.parets_tova, pilars_acer: @estructura.pilars_acer, pilars_ferro_colat: @estructura.pilars_ferro_colat, pilars_formigo_armat: @estructura.pilars_formigo_armat, pilars_mao: @estructura.pilars_mao, solera: @estructura.solera }
    assert_redirected_to estructura_path(assigns(:estructura))
  end

  test "should destroy estructura" do
    assert_difference('Estructura.count', -1) do
      delete :destroy, id: @estructura
    end

    assert_redirected_to estructures_path
  end
end
