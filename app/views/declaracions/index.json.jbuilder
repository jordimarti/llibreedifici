json.array!(@declaracions) do |declaracio|
  json.extract! declaracio, :id, :edifici_id, :notari, :n_protocol, :data_declaracio
  json.url declaracio_url(declaracio, format: :json)
end
