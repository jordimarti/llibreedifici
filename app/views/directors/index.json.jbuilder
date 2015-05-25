json.array!(@directors) do |director|
  json.extract! director, :id, :edifici_id, :nom_director, :titulacio_director, :rao_social_director, :nif_director
  json.url director_url(director, format: :json)
end
