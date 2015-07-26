json.array!(@telecomunicacions) do |telecomunicacio|
  json.extract! telecomunicacio, :id, :edifici_id, :porter_audio, :porter_video, :antena_individual, :antena_colectiva, :parabolica_individual, :parabolica_colectiva, :telefonia, :riti, :rits, :ritu, :ritm
  json.url telecomunicacio_url(telecomunicacio, format: :json)
end
