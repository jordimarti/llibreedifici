require 'test_helper'

class UsuariFacturesControllerTest < ActionController::TestCase
  setup do
    @usuari_factura = usuari_factures(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:usuari_factures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create usuari_factura" do
    assert_difference('UsuariFactura.count') do
      post :create, usuari_factura: { adreca: @usuari_factura.adreca, codi_postal: @usuari_factura.codi_postal, colegiat: @usuari_factura.colegiat, edifici_id: @usuari_factura.edifici_id, email: @usuari_factura.email, nom: @usuari_factura.nom, num_client: @usuari_factura.num_client, pais: @usuari_factura.pais, poblacio: @usuari_factura.poblacio, provincia: @usuari_factura.provincia, user_id: @usuari_factura.user_id }
    end

    assert_redirected_to usuari_factura_path(assigns(:usuari_factura))
  end

  test "should show usuari_factura" do
    get :show, id: @usuari_factura
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @usuari_factura
    assert_response :success
  end

  test "should update usuari_factura" do
    patch :update, id: @usuari_factura, usuari_factura: { adreca: @usuari_factura.adreca, codi_postal: @usuari_factura.codi_postal, colegiat: @usuari_factura.colegiat, edifici_id: @usuari_factura.edifici_id, email: @usuari_factura.email, nom: @usuari_factura.nom, num_client: @usuari_factura.num_client, pais: @usuari_factura.pais, poblacio: @usuari_factura.poblacio, provincia: @usuari_factura.provincia, user_id: @usuari_factura.user_id }
    assert_redirected_to usuari_factura_path(assigns(:usuari_factura))
  end

  test "should destroy usuari_factura" do
    assert_difference('UsuariFactura.count', -1) do
      delete :destroy, id: @usuari_factura
    end

    assert_redirected_to usuari_factures_path
  end
end
