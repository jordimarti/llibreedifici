json.array!(@signatura_instruccions) do |signatura_instruccion|
  json.extract! signatura_instruccion, :id, :edifici_id, :autor_instruccions_nom, :autor_instruccions_titulacio
  json.url signatura_instruccion_url(signatura_instruccion, format: :json)
end
