require 'test_helper'

class ExecucioDirectorsControllerTest < ActionController::TestCase
  setup do
    @execucio_director = execucio_directors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:execucio_directors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create execucio_director" do
    assert_difference('ExecucioDirector.count') do
      post :create, execucio_director: { edifici_id: @execucio_director.edifici_id, nif_director_execucio: @execucio_director.nif_director_execucio, nom_director_execucio: @execucio_director.nom_director_execucio, rao_social_director_execucio: @execucio_director.rao_social_director_execucio, titulacio_director_execucio: @execucio_director.titulacio_director_execucio }
    end

    assert_redirected_to execucio_director_path(assigns(:execucio_director))
  end

  test "should show execucio_director" do
    get :show, id: @execucio_director
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @execucio_director
    assert_response :success
  end

  test "should update execucio_director" do
    patch :update, id: @execucio_director, execucio_director: { edifici_id: @execucio_director.edifici_id, nif_director_execucio: @execucio_director.nif_director_execucio, nom_director_execucio: @execucio_director.nom_director_execucio, rao_social_director_execucio: @execucio_director.rao_social_director_execucio, titulacio_director_execucio: @execucio_director.titulacio_director_execucio }
    assert_redirected_to execucio_director_path(assigns(:execucio_director))
  end

  test "should destroy execucio_director" do
    assert_difference('ExecucioDirector.count', -1) do
      delete :destroy, id: @execucio_director
    end

    assert_redirected_to execucio_directors_path
  end
end
