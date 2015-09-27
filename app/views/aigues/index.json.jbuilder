json.array!(@aigues) do |aigua|
  json.extract! aigua, :id, :edifici_id, :connexio_directa, :connexio_aforament, :captacio_propia, :comptador_unic, :comptadors_individuals_habitatge, :comptadors_individuals_centralitzats, :grup_pressio, :muntants_plom, :muntants_ferro, :muntants_coure, :muntants_plastic
  json.url aigua_url(aigua, format: :json)
end