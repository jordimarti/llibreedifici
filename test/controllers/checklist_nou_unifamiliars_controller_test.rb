require 'test_helper'

class ChecklistNouUnifamiliarsControllerTest < ActionController::TestCase
  setup do
    @checklist_nou_unifamiliar = checklist_nou_unifamiliars(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:checklist_nou_unifamiliars)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create checklist_nou_unifamiliar" do
    assert_difference('ChecklistNouUnifamiliar.count') do
      post :create, checklist_nou_unifamiliar: { acta_recepcio_obra: @checklist_nou_unifamiliar.acta_recepcio_obra, carregues_reals: @checklist_nou_unifamiliar.carregues_reals, cedules_regims_juridics: @checklist_nou_unifamiliar.cedules_regims_juridics, certificacio_energetica: @checklist_nou_unifamiliar.certificacio_energetica, certificat_final_obra: @checklist_nou_unifamiliar.certificat_final_obra, declaracions_ce_ascensors: @checklist_nou_unifamiliar.declaracions_ce_ascensors, documents_acreditatius_ajuts: @checklist_nou_unifamiliar.documents_acreditatius_ajuts, documents_complementaris: @checklist_nou_unifamiliar.documents_complementaris, documents_garantia: @checklist_nou_unifamiliar.documents_garantia, documents_justificacio_operacions: @checklist_nou_unifamiliar.documents_justificacio_operacions, edifici_id: @checklist_nou_unifamiliar.edifici_id, escriptura_publica: @checklist_nou_unifamiliar.escriptura_publica, llicencies_preceptives: @checklist_nou_unifamiliar.llicencies_preceptives, polissa_assegurances: @checklist_nou_unifamiliar.polissa_assegurances }
    end

    assert_redirected_to checklist_nou_unifamiliar_path(assigns(:checklist_nou_unifamiliar))
  end

  test "should show checklist_nou_unifamiliar" do
    get :show, id: @checklist_nou_unifamiliar
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @checklist_nou_unifamiliar
    assert_response :success
  end

  test "should update checklist_nou_unifamiliar" do
    patch :update, id: @checklist_nou_unifamiliar, checklist_nou_unifamiliar: { acta_recepcio_obra: @checklist_nou_unifamiliar.acta_recepcio_obra, carregues_reals: @checklist_nou_unifamiliar.carregues_reals, cedules_regims_juridics: @checklist_nou_unifamiliar.cedules_regims_juridics, certificacio_energetica: @checklist_nou_unifamiliar.certificacio_energetica, certificat_final_obra: @checklist_nou_unifamiliar.certificat_final_obra, declaracions_ce_ascensors: @checklist_nou_unifamiliar.declaracions_ce_ascensors, documents_acreditatius_ajuts: @checklist_nou_unifamiliar.documents_acreditatius_ajuts, documents_complementaris: @checklist_nou_unifamiliar.documents_complementaris, documents_garantia: @checklist_nou_unifamiliar.documents_garantia, documents_justificacio_operacions: @checklist_nou_unifamiliar.documents_justificacio_operacions, edifici_id: @checklist_nou_unifamiliar.edifici_id, escriptura_publica: @checklist_nou_unifamiliar.escriptura_publica, llicencies_preceptives: @checklist_nou_unifamiliar.llicencies_preceptives, polissa_assegurances: @checklist_nou_unifamiliar.polissa_assegurances }
    assert_redirected_to checklist_nou_unifamiliar_path(assigns(:checklist_nou_unifamiliar))
  end

  test "should destroy checklist_nou_unifamiliar" do
    assert_difference('ChecklistNouUnifamiliar.count', -1) do
      delete :destroy, id: @checklist_nou_unifamiliar
    end

    assert_redirected_to checklist_nou_unifamiliars_path
  end
end
