require 'test_helper'

class ChecklistNouTerciarisControllerTest < ActionController::TestCase
  setup do
    @checklist_nou_terciari = checklist_nou_terciaris(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:checklist_nou_terciaris)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create checklist_nou_terciari" do
    assert_difference('ChecklistNouTerciari.count') do
      post :create, checklist_nou_terciari: { acta_recepcio_obra: @checklist_nou_terciari.acta_recepcio_obra, carregues_reals: @checklist_nou_terciari.carregues_reals, certificacio_energetica: @checklist_nou_terciari.certificacio_energetica, certificat_final_obra: @checklist_nou_terciari.certificat_final_obra, declaracions_ce_ascensors: @checklist_nou_terciari.declaracions_ce_ascensors, documents_acreditatius_ajuts: @checklist_nou_terciari.documents_acreditatius_ajuts, documents_complementaris: @checklist_nou_terciari.documents_complementaris, documents_garantia: @checklist_nou_terciari.documents_garantia, documents_justificacio_operacions: @checklist_nou_terciari.documents_justificacio_operacions, edifici_id: @checklist_nou_terciari.edifici_id, escriptura_publica: @checklist_nou_terciari.escriptura_publica, llicencies_preceptives: @checklist_nou_terciari.llicencies_preceptives, polissa_assegurances: @checklist_nou_terciari.polissa_assegurances }
    end

    assert_redirected_to checklist_nou_terciari_path(assigns(:checklist_nou_terciari))
  end

  test "should show checklist_nou_terciari" do
    get :show, id: @checklist_nou_terciari
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @checklist_nou_terciari
    assert_response :success
  end

  test "should update checklist_nou_terciari" do
    patch :update, id: @checklist_nou_terciari, checklist_nou_terciari: { acta_recepcio_obra: @checklist_nou_terciari.acta_recepcio_obra, carregues_reals: @checklist_nou_terciari.carregues_reals, certificacio_energetica: @checklist_nou_terciari.certificacio_energetica, certificat_final_obra: @checklist_nou_terciari.certificat_final_obra, declaracions_ce_ascensors: @checklist_nou_terciari.declaracions_ce_ascensors, documents_acreditatius_ajuts: @checklist_nou_terciari.documents_acreditatius_ajuts, documents_complementaris: @checklist_nou_terciari.documents_complementaris, documents_garantia: @checklist_nou_terciari.documents_garantia, documents_justificacio_operacions: @checklist_nou_terciari.documents_justificacio_operacions, edifici_id: @checklist_nou_terciari.edifici_id, escriptura_publica: @checklist_nou_terciari.escriptura_publica, llicencies_preceptives: @checklist_nou_terciari.llicencies_preceptives, polissa_assegurances: @checklist_nou_terciari.polissa_assegurances }
    assert_redirected_to checklist_nou_terciari_path(assigns(:checklist_nou_terciari))
  end

  test "should destroy checklist_nou_terciari" do
    assert_difference('ChecklistNouTerciari.count', -1) do
      delete :destroy, id: @checklist_nou_terciari
    end

    assert_redirected_to checklist_nou_terciaris_path
  end
end
