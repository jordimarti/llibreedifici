json.array!(@signatura_llibres) do |signatura_llibre|
  json.extract! signatura_llibre, :id, :edifici_id, :autor_llibre_nom, :autor_llibre_titulacio
  json.url signatura_llibre_url(signatura_llibre, format: :json)
end
