json.array!(@promotors) do |promotor|
  json.extract! promotor, :id, :edifici_id, :nom_promotor, :nif_promotor, :tipus_via_promotor, :via_promotor, :numero_promotor, :bloc_promotor, :escala_promotor, :pis_promotor, :cp_promotor, :poblacio_promotor, :provincia_promotor, :pais_promotor
  json.url promotor_url(promotor, format: :json)
end
