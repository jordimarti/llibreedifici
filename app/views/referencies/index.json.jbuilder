json.array!(@referencies) do |referencia|
  json.extract! referencia, :id, :edifici_id, :operacio_id
  json.url referencia_url(referencia, format: :json)
end
