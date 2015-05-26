json.array!(@projectistes) do |projectista|
  json.extract! projectista, :id, :edifici_id, :nom_projectista, :titulacio_projectista, :rao_social_projectista, :nif_projectista
  json.url projectista_url(projectista, format: :json)
end
