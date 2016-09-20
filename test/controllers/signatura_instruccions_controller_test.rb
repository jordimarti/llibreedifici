require 'test_helper'

class SignaturaInstruccionsControllerTest < ActionController::TestCase
  setup do
    @signatura_instruccion = signatura_instruccions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:signatura_instruccions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create signatura_instruccion" do
    assert_difference('SignaturaInstruccion.count') do
      post :create, signatura_instruccion: { autor_instruccions_nom: @signatura_instruccion.autor_instruccions_nom, autor_instruccions_titulacio: @signatura_instruccion.autor_instruccions_titulacio, edifici_id: @signatura_instruccion.edifici_id }
    end

    assert_redirected_to signatura_instruccion_path(assigns(:signatura_instruccion))
  end

  test "should show signatura_instruccion" do
    get :show, id: @signatura_instruccion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @signatura_instruccion
    assert_response :success
  end

  test "should update signatura_instruccion" do
    patch :update, id: @signatura_instruccion, signatura_instruccion: { autor_instruccions_nom: @signatura_instruccion.autor_instruccions_nom, autor_instruccions_titulacio: @signatura_instruccion.autor_instruccions_titulacio, edifici_id: @signatura_instruccion.edifici_id }
    assert_redirected_to signatura_instruccion_path(assigns(:signatura_instruccion))
  end

  test "should destroy signatura_instruccion" do
    assert_difference('SignaturaInstruccion.count', -1) do
      delete :destroy, id: @signatura_instruccion
    end

    assert_redirected_to signatura_instruccions_path
  end
end
