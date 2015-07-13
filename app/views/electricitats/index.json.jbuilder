json.array!(@electricitats) do |electricitat|
  json.extract! electricitat, :id, :edifici_id, :enllumenat_comunitari, :mes_100k, :connexio_terra, :centre_transformacio, :fotovoltaica, :comptador_unic, :comptadors_individuals_habitatge, :comptadors_centralitzats
  json.url electricitat_url(electricitat, format: :json)
end
