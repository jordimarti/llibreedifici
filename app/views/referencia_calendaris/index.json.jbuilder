json.array!(@referencia_calendaris) do |referencia_calendari|
  json.extract! referencia_calendari, :id, :edifici_id, :operacio_id, :any
  json.url referencia_calendari_url(referencia_calendari, format: :json)
end
