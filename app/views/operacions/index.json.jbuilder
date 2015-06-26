json.array!(@operacions) do |operacio|
  json.extract! operacio, :id, :descripcio, :periodicitat, :document_referencia, :responsable, :obligatorietat, :creat_usuari
  json.url operacio_url(operacio, format: :json)
end
