require 'test_helper'

class EnergiaCertificatsControllerTest < ActionController::TestCase
  setup do
    @energia_certificat = energia_certificats(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:energia_certificats)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create energia_certificat" do
    assert_difference('EnergiaCertificat.count') do
      post :create, energia_certificat: { consum_energia_primaria: @energia_certificat.consum_energia_primaria, edifici_id: @energia_certificat.edifici_id, emissions_co2: @energia_certificat.emissions_co2, numero_registre: @energia_certificat.numero_registre, qualificacio_energetica: @energia_certificat.qualificacio_energetica, vigencia: @energia_certificat.vigencia }
    end

    assert_redirected_to energia_certificat_path(assigns(:energia_certificat))
  end

  test "should show energia_certificat" do
    get :show, id: @energia_certificat
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @energia_certificat
    assert_response :success
  end

  test "should update energia_certificat" do
    patch :update, id: @energia_certificat, energia_certificat: { consum_energia_primaria: @energia_certificat.consum_energia_primaria, edifici_id: @energia_certificat.edifici_id, emissions_co2: @energia_certificat.emissions_co2, numero_registre: @energia_certificat.numero_registre, qualificacio_energetica: @energia_certificat.qualificacio_energetica, vigencia: @energia_certificat.vigencia }
    assert_redirected_to energia_certificat_path(assigns(:energia_certificat))
  end

  test "should destroy energia_certificat" do
    assert_difference('EnergiaCertificat.count', -1) do
      delete :destroy, id: @energia_certificat
    end

    assert_redirected_to energia_certificats_path
  end
end
