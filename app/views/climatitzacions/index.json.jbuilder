json.array!(@climatitzacions) do |climatitzacio|
  json.extract! climatitzacio, :id, :edifici_id, :escalfador_pn_menor_24, :escalfador_pn_24_70, :escalfador_pn_major_70, :caldera_biomassa, :caldera_solar_termica, :altres_pn_menor_70, :altres_pn_major_70, :clima_pn_menor_12_autonoms, :clima_pn_menor_12_torres, :clima_pn_menor_12_recuperador, :clima_pn_12_70_autonoms, :clima_pn_12_70_torres, :clima_pn_12_70_recuperador, :clima_pn_major_70_autonoms, :clima_pn_major_70_torres, :clima_pn_major_70_recuperador
  json.url climatitzacio_url(climatitzacio, format: :json)
end
