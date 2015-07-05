json.array!(@cobertes) do |coberta|
  json.extract! coberta, :id, :edifici_id, :terrat_transitable, :terrat_no_transitable, :terrat_aillament_termic, :terrat_lamina_impermeabilitzant, :coberta_teula_arab, :coberta_teula_plana, :coberta_teula_ciment, :coberta_pissarra, :coberta_fibrociment, :coberta_asfaltica, :coberta_xapa_acer, :coberta_xapa_coure, :coberta_aillament_termic
  json.url coberta_url(coberta, format: :json)
end
