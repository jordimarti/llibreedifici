json.array!(@ventilacions) do |ventilacio|
  json.extract! ventilacio, :id, :edifici_id, :habitatge_natural_conductes, :habitatge_natural_obertures, :habitatge_mecanica_conductes, :habitatge_mecanica_obertures, :habitatge_mecanica_control, :traster_natural_conductes, :traster_natural_obertures, :traster_mecanica_conductes, :traster_mecanica_obertures, :traster_mecanica_control, :magatzem_natural_conductes, :magatzem_natural_obertures, :magatzem_mecanica_conductes, :magatzem_mecanica_obertures, :magatzem_mecanica_control, :garatge_natural_conductes, :garatge_natural_obertures, :garatge_mecanica_conductes, :garatge_mecanica_obertures, :garatge_mecanica_control
  json.url ventilacio_url(ventilacio, format: :json)
end
