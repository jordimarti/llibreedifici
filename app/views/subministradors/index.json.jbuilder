json.array!(@subministradors) do |subministrador|
  json.extract! subministrador, :id, :edifici_id, :nom_subministrador, :nif_subministrador, :adreca_subministrador, :cp_subministrador, :poblacio_subministrador, :provincia_subministrador, :pais_subministrador
  json.url subministrador_url(subministrador, format: :json)
end
