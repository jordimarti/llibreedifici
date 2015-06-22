json.array!(@identificacions) do |identificacio|
  json.extract! identificacio, :id, :edifici_id, :tipus_via_edifici, :via_edifici, :numero_edifici, :bloc_edifici, :escala_edifici, :cp_edifici, :poblacio_edifici, :provincia_edifici, :ref_cadastral, :us_edifici, :any_inici_construccio, :any_fi_construccio
  json.url identificacio_url(identificacio, format: :json)
end
