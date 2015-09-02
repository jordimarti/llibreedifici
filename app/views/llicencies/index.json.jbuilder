json.array!(@llicencies) do |llicencia|
  json.extract! llicencia, :id, :edifici_id, :classe, :data_llicencia
  json.url llicencia_url(llicencia, format: :json)
end
