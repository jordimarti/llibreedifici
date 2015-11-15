require 'test_helper'

class AptitudCertificatsControllerTest < ActionController::TestCase
  setup do
    @aptitud_certificat = aptitud_certificats(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:aptitud_certificats)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create aptitud_certificat" do
    assert_difference('AptitudCertificat.count') do
      post :create, aptitud_certificat: { certificat_aptitud: @aptitud_certificat.certificat_aptitud, codi_informe: @aptitud_certificat.codi_informe, data_ite: @aptitud_certificat.data_ite, data_programa: @aptitud_certificat.data_programa, edifici_id: @aptitud_certificat.edifici_id, necessitat_verificacions_tecniques: @aptitud_certificat.necessitat_verificacions_tecniques, numero_expedient: @aptitud_certificat.numero_expedient, periodicitat_verificacions_tecniques: @aptitud_certificat.periodicitat_verificacions_tecniques }
    end

    assert_redirected_to aptitud_certificat_path(assigns(:aptitud_certificat))
  end

  test "should show aptitud_certificat" do
    get :show, id: @aptitud_certificat
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @aptitud_certificat
    assert_response :success
  end

  test "should update aptitud_certificat" do
    patch :update, id: @aptitud_certificat, aptitud_certificat: { certificat_aptitud: @aptitud_certificat.certificat_aptitud, codi_informe: @aptitud_certificat.codi_informe, data_ite: @aptitud_certificat.data_ite, data_programa: @aptitud_certificat.data_programa, edifici_id: @aptitud_certificat.edifici_id, necessitat_verificacions_tecniques: @aptitud_certificat.necessitat_verificacions_tecniques, numero_expedient: @aptitud_certificat.numero_expedient, periodicitat_verificacions_tecniques: @aptitud_certificat.periodicitat_verificacions_tecniques }
    assert_redirected_to aptitud_certificat_path(assigns(:aptitud_certificat))
  end

  test "should destroy aptitud_certificat" do
    assert_difference('AptitudCertificat.count', -1) do
      delete :destroy, id: @aptitud_certificat
    end

    assert_redirected_to aptitud_certificats_path
  end
end
