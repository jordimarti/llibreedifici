json.array!(@execucio_directors) do |execucio_director|
  json.extract! execucio_director, :id, :edifici_id, :nom_director_execucio, :titulacio_director_execucio, :rao_social_director_execucio, :nif_director_execucio
  json.url execucio_director_url(execucio_director, format: :json)
end
