json.array!(@regim_propietats) do |regim_propietat|
  json.extract! regim_propietat, :id, :edifici_id, :tipus_regim_propietat, :document_escriptura
  json.url regim_propietat_url(regim_propietat, format: :json)
end
