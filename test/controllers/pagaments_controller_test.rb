require 'test_helper'

class PagamentsControllerTest < ActionController::TestCase
  setup do
    @pagament = pagaments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pagaments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pagament" do
    assert_difference('Pagament.count') do
      post :create, pagament: { codi_autoritzacio: @pagament.codi_autoritzacio, codi_retorn: @pagament.codi_retorn, edifici_id: @pagament.edifici_id, import: @pagament.import, numorder: @pagament.numorder, user_id: @pagament.user_id }
    end

    assert_redirected_to pagament_path(assigns(:pagament))
  end

  test "should show pagament" do
    get :show, id: @pagament
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pagament
    assert_response :success
  end

  test "should update pagament" do
    patch :update, id: @pagament, pagament: { codi_autoritzacio: @pagament.codi_autoritzacio, codi_retorn: @pagament.codi_retorn, edifici_id: @pagament.edifici_id, import: @pagament.import, numorder: @pagament.numorder, user_id: @pagament.user_id }
    assert_redirected_to pagament_path(assigns(:pagament))
  end

  test "should destroy pagament" do
    assert_difference('Pagament.count', -1) do
      delete :destroy, id: @pagament
    end

    assert_redirected_to pagaments_path
  end
end
