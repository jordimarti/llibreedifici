json.array!(@constructors) do |constructor|
  json.extract! constructor, :id, :edifici_id, :nom_constructor, :nif_constructor, :tipus_via_constructor, :via_constructor, :numero_constructor, :bloc_constructor, :escala_constructor, :pis_constructor, :cp_constructor, :poblacio_constructor, :provincia_constructor, :pais_constructor
  json.url constructor_url(constructor, format: :json)
end
