require 'test_helper'

class SignaturaLlibresControllerTest < ActionController::TestCase
  setup do
    @signatura_llibre = signatura_llibres(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:signatura_llibres)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create signatura_llibre" do
    assert_difference('SignaturaLlibre.count') do
      post :create, signatura_llibre: { autor_llibre_nom: @signatura_llibre.autor_llibre_nom, autor_llibre_titulacio: @signatura_llibre.autor_llibre_titulacio, edifici_id: @signatura_llibre.edifici_id }
    end

    assert_redirected_to signatura_llibre_path(assigns(:signatura_llibre))
  end

  test "should show signatura_llibre" do
    get :show, id: @signatura_llibre
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @signatura_llibre
    assert_response :success
  end

  test "should update signatura_llibre" do
    patch :update, id: @signatura_llibre, signatura_llibre: { autor_llibre_nom: @signatura_llibre.autor_llibre_nom, autor_llibre_titulacio: @signatura_llibre.autor_llibre_titulacio, edifici_id: @signatura_llibre.edifici_id }
    assert_redirected_to signatura_llibre_path(assigns(:signatura_llibre))
  end

  test "should destroy signatura_llibre" do
    assert_difference('SignaturaLlibre.count', -1) do
      delete :destroy, id: @signatura_llibre
    end

    assert_redirected_to signatura_llibres_path
  end
end
