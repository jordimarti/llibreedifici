json.array!(@info_usuaris) do |info_usuari|
  json.extract! info_usuari, :id, :user_id, :nom, :cognoms, :adreca, :codi_postal, :poblacio, :provincia, :pais, :telefon_fix, :telefon_mobil, :fax, :num_premaat, :num_musaat, :sexe, :any_naixement, :nif, :web
  json.url info_usuari_url(info_usuari, format: :json)
end
