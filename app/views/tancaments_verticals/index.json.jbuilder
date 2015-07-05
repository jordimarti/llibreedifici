json.array!(@tancaments_verticals) do |tancaments_vertical|
  json.extract! tancaments_vertical, :id, :edifici_id, :acabat_vist_paredat, :acabat_vist_carreus, :acabat_vist_fabrica_mao, :acabat_vist_fabrica_bloc_ceramic, :acabat_vist_bloc_formigo, :acabat_vist_panell_formigo, :acabat_vist_panell_metalic_sandwich, :acabat_revestit_arrebossat_pintat, :acabat_revestit_estucat, :acabat_revestit_morter_monocapa, :acabat_revestit_aplacat_ceramic, :acabat_revestit_aplacat_pedra, :acabat_revestit_xapa_metalica, :cambra_aire_facana, :fusteria_fusta, :fusteria_acer, :fusteria_alumini, :fusteria_pvc, :vidre_simple, :vidre_doble, :vidre_triple, :vidre_baix_emissiu, :vidre_control_solar
  json.url tancaments_vertical_url(tancaments_vertical, format: :json)
end
