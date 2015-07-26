json.array!(@especials) do |especial|
  json.extract! especial, :id, :edifici_id, :piscina_estructura_obra, :piscina_estructura_composite, :piscina_estructura_acer, :piscina_vores_formigo, :piscina_vores_pedra, :piscina_ceramica, :piscina_porcellana, :piscina_climatitzacio, :piscina_iluminacio, :piscina_purificador
  json.url especial_url(especial, format: :json)
end
