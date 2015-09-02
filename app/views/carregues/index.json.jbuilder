json.array!(@carregues) do |carrega|
  json.extract! carrega, :id, :edifici_id, :tipus_carrega, :document_carrega
  json.url carrega_url(carrega, format: :json)
end
