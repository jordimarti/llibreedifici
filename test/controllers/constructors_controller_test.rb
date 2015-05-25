require 'test_helper'

class ConstructorsControllerTest < ActionController::TestCase
  setup do
    @constructor = constructors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:constructors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create constructor" do
    assert_difference('Constructor.count') do
      post :create, constructor: { bloc_constructor: @constructor.bloc_constructor, cp_constructor: @constructor.cp_constructor, edifici_id: @constructor.edifici_id, escala_constructor: @constructor.escala_constructor, nif_constructor: @constructor.nif_constructor, nom_constructor: @constructor.nom_constructor, numero_constructor: @constructor.numero_constructor, pais_constructor: @constructor.pais_constructor, pis_constructor: @constructor.pis_constructor, poblacio_constructor: @constructor.poblacio_constructor, provincia_constructor: @constructor.provincia_constructor, tipus_via_constructor: @constructor.tipus_via_constructor, via_constructor: @constructor.via_constructor }
    end

    assert_redirected_to constructor_path(assigns(:constructor))
  end

  test "should show constructor" do
    get :show, id: @constructor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @constructor
    assert_response :success
  end

  test "should update constructor" do
    patch :update, id: @constructor, constructor: { bloc_constructor: @constructor.bloc_constructor, cp_constructor: @constructor.cp_constructor, edifici_id: @constructor.edifici_id, escala_constructor: @constructor.escala_constructor, nif_constructor: @constructor.nif_constructor, nom_constructor: @constructor.nom_constructor, numero_constructor: @constructor.numero_constructor, pais_constructor: @constructor.pais_constructor, pis_constructor: @constructor.pis_constructor, poblacio_constructor: @constructor.poblacio_constructor, provincia_constructor: @constructor.provincia_constructor, tipus_via_constructor: @constructor.tipus_via_constructor, via_constructor: @constructor.via_constructor }
    assert_redirected_to constructor_path(assigns(:constructor))
  end

  test "should destroy constructor" do
    assert_difference('Constructor.count', -1) do
      delete :destroy, id: @constructor
    end

    assert_redirected_to constructors_path
  end
end
