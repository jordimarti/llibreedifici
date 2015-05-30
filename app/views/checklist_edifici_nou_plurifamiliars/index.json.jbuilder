json.array!(@checklist_edifici_nou_plurifamiliars) do |checklist_edifici_nou_plurifamiliar|
  json.extract! checklist_edifici_nou_plurifamiliar, :id, :edifici_id, :dades, :planol_emplacament, :foto_facana, :promotor, :projectista, :constructor, :director, :director_execucio, :laboratori, :entitat_control, :subministrador, :industrial, :llicencia, :declaracio_obra_nova, :regim_propietat, :carregues, :entitats_juridiques, :acta_lliurament, :canvis_titularitat, :reformes, :canvis_dades_inicials, :ajuts, :assegurances, :enunciats_incidencies, :registre_operacions_manteniment, :registre_operacions_reparacio, :registre_operacions_millora, :registre_actuacions_arquitectoniques, :planols, :esquemes_instalacions, :descripcio_pes, :instruccions_us_manteniment, :documents_substitucio, :recomanacions_emergencies, :planols_habitatge, :planols_elements_privatius, :instruccions_us_manteniment_habitatge, :garanties_manuals_equips, :llicencies_preceptives, :certificat_final_obra, :acta_recepcio_obra, :escriptura_publica, :documents_garantia, :documents_garantia_parts_comunes, :certificacio_energetica, :polissa_assegurances, :escriptura_propietat_horitzontal, :estatus_comunitat, :cedules_regims_juridics, :carregues_reals, :documents_complementaris, :documents_acreditatius_ajuts, :documents_justificacio_operacions, :certificat_final_obra_instalacions, :declaracions_ce_ascensors
  json.url checklist_edifici_nou_plurifamiliar_url(checklist_edifici_nou_plurifamiliar, format: :json)
end
