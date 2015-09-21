require 'test_helper'

class GarantiaConstructorsControllerTest < ActionController::TestCase
  setup do
    @garantia_constructor = garantia_constructors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:garantia_constructors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create garantia_constructor" do
    assert_difference('GarantiaConstructor.count') do
      post :create, garantia_constructor: { edifici_id: @garantia_constructor.edifici_id, referencia: @garantia_constructor.referencia, tipus: @garantia_constructor.tipus, venciment: @garantia_constructor.venciment }
    end

    assert_redirected_to garantia_constructor_path(assigns(:garantia_constructor))
  end

  test "should show garantia_constructor" do
    get :show, id: @garantia_constructor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @garantia_constructor
    assert_response :success
  end

  test "should update garantia_constructor" do
    patch :update, id: @garantia_constructor, garantia_constructor: { edifici_id: @garantia_constructor.edifici_id, referencia: @garantia_constructor.referencia, tipus: @garantia_constructor.tipus, venciment: @garantia_constructor.venciment }
    assert_redirected_to garantia_constructor_path(assigns(:garantia_constructor))
  end

  test "should destroy garantia_constructor" do
    assert_difference('GarantiaConstructor.count', -1) do
      delete :destroy, id: @garantia_constructor
    end

    assert_redirected_to garantia_constructors_path
  end
end
