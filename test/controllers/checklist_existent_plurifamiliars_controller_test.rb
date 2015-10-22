require 'test_helper'

class ChecklistExistentPlurifamiliarsControllerTest < ActionController::TestCase
  setup do
    @checklist_existent_plurifamiliar = checklist_existent_plurifamiliars(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:checklist_existent_plurifamiliars)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create checklist_existent_plurifamiliar" do
    assert_difference('ChecklistExistentPlurifamiliar.count') do
      post :create, checklist_existent_plurifamiliar: { certificacio_energetica: @checklist_existent_plurifamiliar.certificacio_energetica, certificat_aptitud: @checklist_existent_plurifamiliar.certificat_aptitud, certificat_final_obra: @checklist_existent_plurifamiliar.certificat_final_obra, certificats_inspeccions_tecniques: @checklist_existent_plurifamiliar.certificats_inspeccions_tecniques, certificats_instalacions_comunes: @checklist_existent_plurifamiliar.certificats_instalacions_comunes, comunicat_ens_local: @checklist_existent_plurifamiliar.comunicat_ens_local, document_lliurament_iite: @checklist_existent_plurifamiliar.document_lliurament_iite, documents_justificatius_operacions: @checklist_existent_plurifamiliar.documents_justificatius_operacions, edifici_id: @checklist_existent_plurifamiliar.edifici_id, iite: @checklist_existent_plurifamiliar.iite, instruccions_us: @checklist_existent_plurifamiliar.instruccions_us, pressupostos_obres: @checklist_existent_plurifamiliar.pressupostos_obres, programa_rehabilitacio: @checklist_existent_plurifamiliar.programa_rehabilitacio }
    end

    assert_redirected_to checklist_existent_plurifamiliar_path(assigns(:checklist_existent_plurifamiliar))
  end

  test "should show checklist_existent_plurifamiliar" do
    get :show, id: @checklist_existent_plurifamiliar
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @checklist_existent_plurifamiliar
    assert_response :success
  end

  test "should update checklist_existent_plurifamiliar" do
    patch :update, id: @checklist_existent_plurifamiliar, checklist_existent_plurifamiliar: { certificacio_energetica: @checklist_existent_plurifamiliar.certificacio_energetica, certificat_aptitud: @checklist_existent_plurifamiliar.certificat_aptitud, certificat_final_obra: @checklist_existent_plurifamiliar.certificat_final_obra, certificats_inspeccions_tecniques: @checklist_existent_plurifamiliar.certificats_inspeccions_tecniques, certificats_instalacions_comunes: @checklist_existent_plurifamiliar.certificats_instalacions_comunes, comunicat_ens_local: @checklist_existent_plurifamiliar.comunicat_ens_local, document_lliurament_iite: @checklist_existent_plurifamiliar.document_lliurament_iite, documents_justificatius_operacions: @checklist_existent_plurifamiliar.documents_justificatius_operacions, edifici_id: @checklist_existent_plurifamiliar.edifici_id, iite: @checklist_existent_plurifamiliar.iite, instruccions_us: @checklist_existent_plurifamiliar.instruccions_us, pressupostos_obres: @checklist_existent_plurifamiliar.pressupostos_obres, programa_rehabilitacio: @checklist_existent_plurifamiliar.programa_rehabilitacio }
    assert_redirected_to checklist_existent_plurifamiliar_path(assigns(:checklist_existent_plurifamiliar))
  end

  test "should destroy checklist_existent_plurifamiliar" do
    assert_difference('ChecklistExistentPlurifamiliar.count', -1) do
      delete :destroy, id: @checklist_existent_plurifamiliar
    end

    assert_redirected_to checklist_existent_plurifamiliars_path
  end
end
