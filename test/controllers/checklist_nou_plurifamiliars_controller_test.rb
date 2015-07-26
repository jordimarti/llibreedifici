require 'test_helper'

class ChecklistNouPlurifamiliarsControllerTest < ActionController::TestCase
  setup do
    @checklist_nou_plurifamiliar = checklist_nou_plurifamiliars(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:checklist_nou_plurifamiliars)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create checklist_nou_plurifamiliar" do
    assert_difference('ChecklistNouPlurifamiliar.count') do
      post :create, checklist_nou_plurifamiliar: { acta_recepcio_obra: @checklist_nou_plurifamiliar.acta_recepcio_obra, carregues_reals: @checklist_nou_plurifamiliar.carregues_reals, cedules_regims_juridics: @checklist_nou_plurifamiliar.cedules_regims_juridics, certificacio_energetica: @checklist_nou_plurifamiliar.certificacio_energetica, certificat_final_obra: @checklist_nou_plurifamiliar.certificat_final_obra, certificat_final_obra_instalacions: @checklist_nou_plurifamiliar.certificat_final_obra_instalacions, declaracions_ce_ascensors: @checklist_nou_plurifamiliar.declaracions_ce_ascensors, documents_acreditatius_ajuts: @checklist_nou_plurifamiliar.documents_acreditatius_ajuts, documents_complementaris: @checklist_nou_plurifamiliar.documents_complementaris, documents_garantia: @checklist_nou_plurifamiliar.documents_garantia, documents_garantia_parts_comunes: @checklist_nou_plurifamiliar.documents_garantia_parts_comunes, documents_justificacio_operacions: @checklist_nou_plurifamiliar.documents_justificacio_operacions, edifici_id: @checklist_nou_plurifamiliar.edifici_id, escriptura_propietat_horitzontal: @checklist_nou_plurifamiliar.escriptura_propietat_horitzontal, escriptura_publica: @checklist_nou_plurifamiliar.escriptura_publica, estatus_comunitat: @checklist_nou_plurifamiliar.estatus_comunitat, llicencies_preceptives: @checklist_nou_plurifamiliar.llicencies_preceptives, polissa_assegurances: @checklist_nou_plurifamiliar.polissa_assegurances }
    end

    assert_redirected_to checklist_nou_plurifamiliar_path(assigns(:checklist_nou_plurifamiliar))
  end

  test "should show checklist_nou_plurifamiliar" do
    get :show, id: @checklist_nou_plurifamiliar
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @checklist_nou_plurifamiliar
    assert_response :success
  end

  test "should update checklist_nou_plurifamiliar" do
    patch :update, id: @checklist_nou_plurifamiliar, checklist_nou_plurifamiliar: { acta_recepcio_obra: @checklist_nou_plurifamiliar.acta_recepcio_obra, carregues_reals: @checklist_nou_plurifamiliar.carregues_reals, cedules_regims_juridics: @checklist_nou_plurifamiliar.cedules_regims_juridics, certificacio_energetica: @checklist_nou_plurifamiliar.certificacio_energetica, certificat_final_obra: @checklist_nou_plurifamiliar.certificat_final_obra, certificat_final_obra_instalacions: @checklist_nou_plurifamiliar.certificat_final_obra_instalacions, declaracions_ce_ascensors: @checklist_nou_plurifamiliar.declaracions_ce_ascensors, documents_acreditatius_ajuts: @checklist_nou_plurifamiliar.documents_acreditatius_ajuts, documents_complementaris: @checklist_nou_plurifamiliar.documents_complementaris, documents_garantia: @checklist_nou_plurifamiliar.documents_garantia, documents_garantia_parts_comunes: @checklist_nou_plurifamiliar.documents_garantia_parts_comunes, documents_justificacio_operacions: @checklist_nou_plurifamiliar.documents_justificacio_operacions, edifici_id: @checklist_nou_plurifamiliar.edifici_id, escriptura_propietat_horitzontal: @checklist_nou_plurifamiliar.escriptura_propietat_horitzontal, escriptura_publica: @checklist_nou_plurifamiliar.escriptura_publica, estatus_comunitat: @checklist_nou_plurifamiliar.estatus_comunitat, llicencies_preceptives: @checklist_nou_plurifamiliar.llicencies_preceptives, polissa_assegurances: @checklist_nou_plurifamiliar.polissa_assegurances }
    assert_redirected_to checklist_nou_plurifamiliar_path(assigns(:checklist_nou_plurifamiliar))
  end

  test "should destroy checklist_nou_plurifamiliar" do
    assert_difference('ChecklistNouPlurifamiliar.count', -1) do
      delete :destroy, id: @checklist_nou_plurifamiliar
    end

    assert_redirected_to checklist_nou_plurifamiliars_path
  end
end
