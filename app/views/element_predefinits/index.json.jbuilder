json.array!(@element_predefinits) do |element_predefinit|
  json.extract! element_predefinit, :id, :nom_element, :sistema_element, :descripcio_ca, :descripcio_es
  json.url element_predefinit_url(element_predefinit, format: :json)
end
