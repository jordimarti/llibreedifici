require 'test_helper'

class TelecomunicacionsControllerTest < ActionController::TestCase
  setup do
    @telecomunicacio = telecomunicacions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:telecomunicacions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create telecomunicacio" do
    assert_difference('Telecomunicacio.count') do
      post :create, telecomunicacio: { antena_colectiva: @telecomunicacio.antena_colectiva, antena_individual: @telecomunicacio.antena_individual, edifici_id: @telecomunicacio.edifici_id, parabolica_colectiva: @telecomunicacio.parabolica_colectiva, parabolica_individual: @telecomunicacio.parabolica_individual, porter_audio: @telecomunicacio.porter_audio, porter_video: @telecomunicacio.porter_video, riti: @telecomunicacio.riti, ritm: @telecomunicacio.ritm, rits: @telecomunicacio.rits, ritu: @telecomunicacio.ritu, telefonia: @telecomunicacio.telefonia }
    end

    assert_redirected_to telecomunicacio_path(assigns(:telecomunicacio))
  end

  test "should show telecomunicacio" do
    get :show, id: @telecomunicacio
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @telecomunicacio
    assert_response :success
  end

  test "should update telecomunicacio" do
    patch :update, id: @telecomunicacio, telecomunicacio: { antena_colectiva: @telecomunicacio.antena_colectiva, antena_individual: @telecomunicacio.antena_individual, edifici_id: @telecomunicacio.edifici_id, parabolica_colectiva: @telecomunicacio.parabolica_colectiva, parabolica_individual: @telecomunicacio.parabolica_individual, porter_audio: @telecomunicacio.porter_audio, porter_video: @telecomunicacio.porter_video, riti: @telecomunicacio.riti, ritm: @telecomunicacio.ritm, rits: @telecomunicacio.rits, ritu: @telecomunicacio.ritu, telefonia: @telecomunicacio.telefonia }
    assert_redirected_to telecomunicacio_path(assigns(:telecomunicacio))
  end

  test "should destroy telecomunicacio" do
    assert_difference('Telecomunicacio.count', -1) do
      delete :destroy, id: @telecomunicacio
    end

    assert_redirected_to telecomunicacions_path
  end
end
