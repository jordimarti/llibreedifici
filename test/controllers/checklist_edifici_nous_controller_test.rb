require 'test_helper'

class ChecklistEdificiNousControllerTest < ActionController::TestCase
  setup do
    @checklist_edifici_nou = checklist_edifici_nous(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:checklist_edifici_nous)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create checklist_edifici_nou" do
    assert_difference('ChecklistEdificiNou.count') do
      post :create, checklist_edifici_nou: { acta_lliurament: @checklist_edifici_nou.acta_lliurament, acta_recepcio_obra: @checklist_edifici_nou.acta_recepcio_obra, ajuts: @checklist_edifici_nou.ajuts, assegurances: @checklist_edifici_nou.assegurances, canvis_dades_inicials: @checklist_edifici_nou.canvis_dades_inicials, canvis_titularitat: @checklist_edifici_nou.canvis_titularitat, carregues: @checklist_edifici_nou.carregues, carregues_reals: @checklist_edifici_nou.carregues_reals, cedules_regims_juridics: @checklist_edifici_nou.cedules_regims_juridics, certificacio_energetica: @checklist_edifici_nou.certificacio_energetica, certificat_final_obra: @checklist_edifici_nou.certificat_final_obra, certificat_final_obra_instalacions: @checklist_edifici_nou.certificat_final_obra_instalacions, constructor: @checklist_edifici_nou.constructor, dades: @checklist_edifici_nou.dades, declaracio_obra_nova: @checklist_edifici_nou.declaracio_obra_nova, declaracions_ce_ascensors: @checklist_edifici_nou.declaracions_ce_ascensors, descripcio_pes: @checklist_edifici_nou.descripcio_pes, director: @checklist_edifici_nou.director, director_execucio: @checklist_edifici_nou.director_execucio, documents_acreditatius_ajuts: @checklist_edifici_nou.documents_acreditatius_ajuts, documents_complementaris: @checklist_edifici_nou.documents_complementaris, documents_garantia: @checklist_edifici_nou.documents_garantia, documents_garantia_parts_comunes: @checklist_edifici_nou.documents_garantia_parts_comunes, documents_justificacio_operacions: @checklist_edifici_nou.documents_justificacio_operacions, documents_substitucio: @checklist_edifici_nou.documents_substitucio, edifici_id: @checklist_edifici_nou.edifici_id, entitat_control: @checklist_edifici_nou.entitat_control, entitats_juridiques: @checklist_edifici_nou.entitats_juridiques, enunciats_incidencies: @checklist_edifici_nou.enunciats_incidencies, escriptura_propietat_horitzontal: @checklist_edifici_nou.escriptura_propietat_horitzontal, escriptura_publica: @checklist_edifici_nou.escriptura_publica, esquemes_instalacions: @checklist_edifici_nou.esquemes_instalacions, estatus_comunitat: @checklist_edifici_nou.estatus_comunitat, foto_facana: @checklist_edifici_nou.foto_facana, garanties_manuals_equips: @checklist_edifici_nou.garanties_manuals_equips, industrial: @checklist_edifici_nou.industrial, instruccions_us_manteniment: @checklist_edifici_nou.instruccions_us_manteniment, instruccions_us_manteniment_habitatge: @checklist_edifici_nou.instruccions_us_manteniment_habitatge, laboratori: @checklist_edifici_nou.laboratori, llicencia: @checklist_edifici_nou.llicencia, llicencies_preceptives: @checklist_edifici_nou.llicencies_preceptives, planol_emplacament: @checklist_edifici_nou.planol_emplacament, planols: @checklist_edifici_nou.planols, planols_elements_privatius: @checklist_edifici_nou.planols_elements_privatius, planols_habitatge: @checklist_edifici_nou.planols_habitatge, polissa_assegurances: @checklist_edifici_nou.polissa_assegurances, projectista: @checklist_edifici_nou.projectista, promotor: @checklist_edifici_nou.promotor, recomanacions_emergencies: @checklist_edifici_nou.recomanacions_emergencies, reformes: @checklist_edifici_nou.reformes, regim_propietat: @checklist_edifici_nou.regim_propietat, registre_actuacions_arquitectoniques: @checklist_edifici_nou.registre_actuacions_arquitectoniques, registre_operacions_manteniment: @checklist_edifici_nou.registre_operacions_manteniment, registre_operacions_millora: @checklist_edifici_nou.registre_operacions_millora, registre_operacions_reparacio: @checklist_edifici_nou.registre_operacions_reparacio, subministrador: @checklist_edifici_nou.subministrador }
    end

    assert_redirected_to checklist_edifici_nou_path(assigns(:checklist_edifici_nou))
  end

  test "should show checklist_edifici_nou" do
    get :show, id: @checklist_edifici_nou
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @checklist_edifici_nou
    assert_response :success
  end

  test "should update checklist_edifici_nou" do
    patch :update, id: @checklist_edifici_nou, checklist_edifici_nou: { acta_lliurament: @checklist_edifici_nou.acta_lliurament, acta_recepcio_obra: @checklist_edifici_nou.acta_recepcio_obra, ajuts: @checklist_edifici_nou.ajuts, assegurances: @checklist_edifici_nou.assegurances, canvis_dades_inicials: @checklist_edifici_nou.canvis_dades_inicials, canvis_titularitat: @checklist_edifici_nou.canvis_titularitat, carregues: @checklist_edifici_nou.carregues, carregues_reals: @checklist_edifici_nou.carregues_reals, cedules_regims_juridics: @checklist_edifici_nou.cedules_regims_juridics, certificacio_energetica: @checklist_edifici_nou.certificacio_energetica, certificat_final_obra: @checklist_edifici_nou.certificat_final_obra, certificat_final_obra_instalacions: @checklist_edifici_nou.certificat_final_obra_instalacions, constructor: @checklist_edifici_nou.constructor, dades: @checklist_edifici_nou.dades, declaracio_obra_nova: @checklist_edifici_nou.declaracio_obra_nova, declaracions_ce_ascensors: @checklist_edifici_nou.declaracions_ce_ascensors, descripcio_pes: @checklist_edifici_nou.descripcio_pes, director: @checklist_edifici_nou.director, director_execucio: @checklist_edifici_nou.director_execucio, documents_acreditatius_ajuts: @checklist_edifici_nou.documents_acreditatius_ajuts, documents_complementaris: @checklist_edifici_nou.documents_complementaris, documents_garantia: @checklist_edifici_nou.documents_garantia, documents_garantia_parts_comunes: @checklist_edifici_nou.documents_garantia_parts_comunes, documents_justificacio_operacions: @checklist_edifici_nou.documents_justificacio_operacions, documents_substitucio: @checklist_edifici_nou.documents_substitucio, edifici_id: @checklist_edifici_nou.edifici_id, entitat_control: @checklist_edifici_nou.entitat_control, entitats_juridiques: @checklist_edifici_nou.entitats_juridiques, enunciats_incidencies: @checklist_edifici_nou.enunciats_incidencies, escriptura_propietat_horitzontal: @checklist_edifici_nou.escriptura_propietat_horitzontal, escriptura_publica: @checklist_edifici_nou.escriptura_publica, esquemes_instalacions: @checklist_edifici_nou.esquemes_instalacions, estatus_comunitat: @checklist_edifici_nou.estatus_comunitat, foto_facana: @checklist_edifici_nou.foto_facana, garanties_manuals_equips: @checklist_edifici_nou.garanties_manuals_equips, industrial: @checklist_edifici_nou.industrial, instruccions_us_manteniment: @checklist_edifici_nou.instruccions_us_manteniment, instruccions_us_manteniment_habitatge: @checklist_edifici_nou.instruccions_us_manteniment_habitatge, laboratori: @checklist_edifici_nou.laboratori, llicencia: @checklist_edifici_nou.llicencia, llicencies_preceptives: @checklist_edifici_nou.llicencies_preceptives, planol_emplacament: @checklist_edifici_nou.planol_emplacament, planols: @checklist_edifici_nou.planols, planols_elements_privatius: @checklist_edifici_nou.planols_elements_privatius, planols_habitatge: @checklist_edifici_nou.planols_habitatge, polissa_assegurances: @checklist_edifici_nou.polissa_assegurances, projectista: @checklist_edifici_nou.projectista, promotor: @checklist_edifici_nou.promotor, recomanacions_emergencies: @checklist_edifici_nou.recomanacions_emergencies, reformes: @checklist_edifici_nou.reformes, regim_propietat: @checklist_edifici_nou.regim_propietat, registre_actuacions_arquitectoniques: @checklist_edifici_nou.registre_actuacions_arquitectoniques, registre_operacions_manteniment: @checklist_edifici_nou.registre_operacions_manteniment, registre_operacions_millora: @checklist_edifici_nou.registre_operacions_millora, registre_operacions_reparacio: @checklist_edifici_nou.registre_operacions_reparacio, subministrador: @checklist_edifici_nou.subministrador }
    assert_redirected_to checklist_edifici_nou_path(assigns(:checklist_edifici_nou))
  end

  test "should destroy checklist_edifici_nou" do
    assert_difference('ChecklistEdificiNou.count', -1) do
      delete :destroy, id: @checklist_edifici_nou
    end

    assert_redirected_to checklist_edifici_nous_path
  end
end
