require 'test_helper'

class EmpresaFacturesControllerTest < ActionController::TestCase
  setup do
    @empresa_factura = empresa_factures(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:empresa_factures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create empresa_factura" do
    assert_difference('EmpresaFactura.count') do
      post :create, empresa_factura: { adreca: @empresa_factura.adreca, codi_postal: @empresa_factura.codi_postal, edifici_id: @empresa_factura.edifici_id, email: @empresa_factura.email, nom_juridic: @empresa_factura.nom_juridic, pais: @empresa_factura.pais, poblacio: @empresa_factura.poblacio, provincia: @empresa_factura.provincia, tipus_client: @empresa_factura.tipus_client, user_id: @empresa_factura.user_id }
    end

    assert_redirected_to empresa_factura_path(assigns(:empresa_factura))
  end

  test "should show empresa_factura" do
    get :show, id: @empresa_factura
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @empresa_factura
    assert_response :success
  end

  test "should update empresa_factura" do
    patch :update, id: @empresa_factura, empresa_factura: { adreca: @empresa_factura.adreca, codi_postal: @empresa_factura.codi_postal, edifici_id: @empresa_factura.edifici_id, email: @empresa_factura.email, nom_juridic: @empresa_factura.nom_juridic, pais: @empresa_factura.pais, poblacio: @empresa_factura.poblacio, provincia: @empresa_factura.provincia, tipus_client: @empresa_factura.tipus_client, user_id: @empresa_factura.user_id }
    assert_redirected_to empresa_factura_path(assigns(:empresa_factura))
  end

  test "should destroy empresa_factura" do
    assert_difference('EmpresaFactura.count', -1) do
      delete :destroy, id: @empresa_factura
    end

    assert_redirected_to empresa_factures_path
  end
end
