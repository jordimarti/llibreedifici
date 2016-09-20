json.array!(@signatura_promotors) do |signatura_promotor|
  json.extract! signatura_promotor, :id, :edifici_id, :promotor_rao_social, :promotor_nom_representant
  json.url signatura_promotor_url(signatura_promotor, format: :json)
end
