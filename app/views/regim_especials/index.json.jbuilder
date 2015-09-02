json.array!(@regim_especials) do |regim_especial|
  json.extract! regim_especial, :id, :edifici_id, :tipus_regim_especial, :referencia_document
  json.url regim_especial_url(regim_especial, format: :json)
end
