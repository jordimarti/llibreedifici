json.array!(@sistemes) do |sistema|
  json.extract! sistema, :id, :edifici_id, :nom_sistema, :pare_sistema
  json.url sistema_url(sistema, format: :json)
end
