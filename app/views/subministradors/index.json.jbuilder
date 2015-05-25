json.array!(@subministradors) do |subministrador|
  json.extract! subministrador, :id, :edifici_id, :nom_subministrador, :nif_subministrador, :tipus_via_subministrador, :via_subministrador, :numero_subministrador, :bloc_subministrador, :escala_subministrador, :pis_subministrador, :cp_subministrador, :poblacio_subministrador, :provincia_subministrador, :pais_subministrador
  json.url subministrador_url(subministrador, format: :json)
end
