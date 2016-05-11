require 'test_helper'

class InfoUsuarisControllerTest < ActionController::TestCase
  setup do
    @info_usuari = info_usuaris(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:info_usuaris)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create info_usuari" do
    assert_difference('InfoUsuari.count') do
      post :create, info_usuari: { adreca: @info_usuari.adreca, any_naixement: @info_usuari.any_naixement, codi_postal: @info_usuari.codi_postal, cognoms: @info_usuari.cognoms, fax: @info_usuari.fax, nif: @info_usuari.nif, nom: @info_usuari.nom, num_musaat: @info_usuari.num_musaat, num_premaat: @info_usuari.num_premaat, pais: @info_usuari.pais, poblacio: @info_usuari.poblacio, provincia: @info_usuari.provincia, sexe: @info_usuari.sexe, telefon_fix: @info_usuari.telefon_fix, telefon_mobil: @info_usuari.telefon_mobil, user_id: @info_usuari.user_id, web: @info_usuari.web }
    end

    assert_redirected_to info_usuari_path(assigns(:info_usuari))
  end

  test "should show info_usuari" do
    get :show, id: @info_usuari
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @info_usuari
    assert_response :success
  end

  test "should update info_usuari" do
    patch :update, id: @info_usuari, info_usuari: { adreca: @info_usuari.adreca, any_naixement: @info_usuari.any_naixement, codi_postal: @info_usuari.codi_postal, cognoms: @info_usuari.cognoms, fax: @info_usuari.fax, nif: @info_usuari.nif, nom: @info_usuari.nom, num_musaat: @info_usuari.num_musaat, num_premaat: @info_usuari.num_premaat, pais: @info_usuari.pais, poblacio: @info_usuari.poblacio, provincia: @info_usuari.provincia, sexe: @info_usuari.sexe, telefon_fix: @info_usuari.telefon_fix, telefon_mobil: @info_usuari.telefon_mobil, user_id: @info_usuari.user_id, web: @info_usuari.web }
    assert_redirected_to info_usuari_path(assigns(:info_usuari))
  end

  test "should destroy info_usuari" do
    assert_difference('InfoUsuari.count', -1) do
      delete :destroy, id: @info_usuari
    end

    assert_redirected_to info_usuaris_path
  end
end
