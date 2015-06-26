json.array!(@industrials) do |industrial|
  json.extract! industrial, :id, :edifici_id, :nom_industrial, :nif_industrial, :adreca_industrial, :cp_industrial, :poblacio_industrial, :provincia_industrial, :pais_industrial
  json.url industrial_url(industrial, format: :json)
end
