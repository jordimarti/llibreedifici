json.array!(@checklist_nou_plurifamiliars) do |checklist_nou_plurifamiliar|
  json.extract! checklist_nou_plurifamiliar, :id, :edifici_id, :llicencies_preceptives, :certificat_final_obra, :acta_recepcio_obra, :escriptura_publica, :documents_garantia, :documents_garantia_parts_comunes, :certificacio_energetica, :polissa_assegurances, :escriptura_propietat_horitzontal, :estatus_comunitat, :cedules_regims_juridics, :carregues_reals, :documents_complementaris, :documents_acreditatius_ajuts, :documents_justificacio_operacions, :certificat_final_obra_instalacions, :declaracions_ce_ascensors
  json.url checklist_nou_plurifamiliar_url(checklist_nou_plurifamiliar, format: :json)
end
