json.array!(@director_execucios) do |director_execucio|
  json.extract! director_execucio, :id, :edifici_id, :nom_director_execucio, :titulacio_director_execucio, :rao_social_director_execucio, :nif_director_execucio
  json.url director_execucio_url(director_execucio, format: :json)
end
