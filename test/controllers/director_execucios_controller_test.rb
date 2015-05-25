require 'test_helper'

class DirectorExecuciosControllerTest < ActionController::TestCase
  setup do
    @director_execucio = director_execucios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:director_execucios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create director_execucio" do
    assert_difference('DirectorExecucio.count') do
      post :create, director_execucio: { edifici_id: @director_execucio.edifici_id, nif_director_execucio: @director_execucio.nif_director_execucio, nom_director_execucio: @director_execucio.nom_director_execucio, rao_social_director_execucio: @director_execucio.rao_social_director_execucio, titulacio_director_execucio: @director_execucio.titulacio_director_execucio }
    end

    assert_redirected_to director_execucio_path(assigns(:director_execucio))
  end

  test "should show director_execucio" do
    get :show, id: @director_execucio
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @director_execucio
    assert_response :success
  end

  test "should update director_execucio" do
    patch :update, id: @director_execucio, director_execucio: { edifici_id: @director_execucio.edifici_id, nif_director_execucio: @director_execucio.nif_director_execucio, nom_director_execucio: @director_execucio.nom_director_execucio, rao_social_director_execucio: @director_execucio.rao_social_director_execucio, titulacio_director_execucio: @director_execucio.titulacio_director_execucio }
    assert_redirected_to director_execucio_path(assigns(:director_execucio))
  end

  test "should destroy director_execucio" do
    assert_difference('DirectorExecucio.count', -1) do
      delete :destroy, id: @director_execucio
    end

    assert_redirected_to director_execucios_path
  end
end
