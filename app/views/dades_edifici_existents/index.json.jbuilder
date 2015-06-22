json.array!(@dades_edifici_existents) do |dades_edifici_existent|
  json.extract! dades_edifici_existent, :id, :edifici_id, :tipus_via_edifici, :via_edifici, :numero_edifici, :bloc_edifici, :escala_edifici, :cp_edifici, :poblacio_edifici, :provincia_edifici, :ref_cadastral, :us_edifici
  json.url dades_edifici_existent_url(dades_edifici_existent, format: :json)
end
