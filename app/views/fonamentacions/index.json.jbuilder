json.array!(@fonamentacions) do |fonamentacio|
  json.extract! fonamentacio, :id, :edifici_id, :mur_pedra, :mur_fabrica_mao, :mur_fabrica_bloc, :mur_formigo_armat, :mur_pantalla, :sabates_paredat, :sabates_formigo, :llosa, :pilons, :pantalles
  json.url fonamentacio_url(fonamentacio, format: :json)
end
