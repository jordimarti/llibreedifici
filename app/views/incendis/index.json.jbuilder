json.array!(@incendis) do |incendi|
  json.extract! incendi, :id, :edifici_id, :alarma_automatica, :alarma_manual, :extintors, :abastiment_aigua, :bie, :hidrants, :ruixadors, :columnes_seques, :parallamps
  json.url incendi_url(incendi, format: :json)
end
