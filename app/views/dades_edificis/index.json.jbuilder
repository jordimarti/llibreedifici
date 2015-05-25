json.array!(@dades_edificis) do |dades_edifici|
  json.extract! dades_edifici, :id, :edifici_id, :tipus_via_edifici, :via_edifici, :numero_edifici, :bloc_edifici, :escala_edifici, :cp_edifici, :poblacio_edifici, :provincia_edifici, :ref_cadastral, :us_edifici, :any_inici_construccio, :any_fi_construccio
  json.url dades_edifici_url(dades_edifici, format: :json)
end
