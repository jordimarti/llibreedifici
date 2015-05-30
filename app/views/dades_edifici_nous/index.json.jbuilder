json.array!(@dades_edifici_nous) do |dades_edifici_nou|
  json.extract! dades_edifici_nou, :id, :edifici_id, :tipus_via_edifici, :via_edifici, :numero_edifici, :bloc_edifici, :escala_edifici, :cp_edifici, :poblacio_edifici, :provincia_edifici, :ref_cadastral, :us_edifici, :any_inici_construccio, :any_fi_construccio
  json.url dades_edifici_nou_url(dades_edifici_nou, format: :json)
end
