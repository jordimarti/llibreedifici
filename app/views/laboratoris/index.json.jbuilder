json.array!(@laboratoris) do |laboratori|
  json.extract! laboratori, :id, :edifici_id, :nom_laboratori, :nif_laboratori
  json.url laboratori_url(laboratori, format: :json)
end
