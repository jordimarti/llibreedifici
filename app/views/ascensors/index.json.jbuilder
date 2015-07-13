json.array!(@ascensors) do |ascensor|
  json.extract! ascensor, :id, :edifici_id, :habitatge_unifamiliar, :edifici_comunitari, :mes_20_plantes, :altres
  json.url ascensor_url(ascensor, format: :json)
end
