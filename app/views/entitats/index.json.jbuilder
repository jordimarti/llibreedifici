json.array!(@entitats) do |entitat|
  json.extract! entitat, :id, :edifici_id, :nom_entitat, :superficie, :destinacio, :quota
  json.url entitat_url(entitat, format: :json)
end
