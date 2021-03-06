json.array!(@sanejaments) do |sanejament|
  json.extract! sanejament, :id, :no_sistema_evacuacio, :si_sistema_evacuacio, :fosa_septica, :colectors_vistos, :bomba_elevacio, :separador_greixos, :baixants_vistos, :baixants_encastats, :baixants_ceramics, :baixants_pvc, :baixants_fibrociment, :baixants_coure, :baixants_alumini, :baixants_polipropile, :baixants_zinc, :colectors_formigo, :colectors_ceramic, :colectors_fibrociment, :colectors_pvc
  json.url sanejament_url(sanejament, format: :json)
end
