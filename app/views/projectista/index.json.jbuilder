json.array!(@projectista) do |projectistum|
  json.extract! projectistum, :id, :edifici_id, :nom_projectista, :titulacio_projectista, :rao_social_projectista, :nif_projectista
  json.url projectistum_url(projectistum, format: :json)
end
