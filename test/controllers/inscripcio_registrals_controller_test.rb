require 'test_helper'

class InscripcioRegistralsControllerTest < ActionController::TestCase
  setup do
    @inscripcio_registral = inscripcio_registrals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:inscripcio_registrals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create inscripcio_registral" do
    assert_difference('InscripcioRegistral.count') do
      post :create, inscripcio_registral: { data: @inscripcio_registral.data, edifici_id: @inscripcio_registral.edifici_id, foli: @inscripcio_registral.foli, llibre: @inscripcio_registral.llibre, numero_finca: @inscripcio_registral.numero_finca, registre: @inscripcio_registral.registre, tom: @inscripcio_registral.tom }
    end

    assert_redirected_to inscripcio_registral_path(assigns(:inscripcio_registral))
  end

  test "should show inscripcio_registral" do
    get :show, id: @inscripcio_registral
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @inscripcio_registral
    assert_response :success
  end

  test "should update inscripcio_registral" do
    patch :update, id: @inscripcio_registral, inscripcio_registral: { data: @inscripcio_registral.data, edifici_id: @inscripcio_registral.edifici_id, foli: @inscripcio_registral.foli, llibre: @inscripcio_registral.llibre, numero_finca: @inscripcio_registral.numero_finca, registre: @inscripcio_registral.registre, tom: @inscripcio_registral.tom }
    assert_redirected_to inscripcio_registral_path(assigns(:inscripcio_registral))
  end

  test "should destroy inscripcio_registral" do
    assert_difference('InscripcioRegistral.count', -1) do
      delete :destroy, id: @inscripcio_registral
    end

    assert_redirected_to inscripcio_registrals_path
  end
end
