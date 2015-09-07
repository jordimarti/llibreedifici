json.array!(@checklist_nou_unifamiliars) do |checklist_nou_unifamiliar|
  json.extract! checklist_nou_unifamiliar, :id, :edifici_id, :llicencies_preceptives, :certificat_final_obra, :acta_recepcio_obra, :escriptura_publica, :documents_garantia, :certificacio_energetica, :polissa_assegurances, :cedules_regims_juridics, :carregues_reals, :documents_complementaris, :documents_acreditatius_ajuts, :documents_justificacio_operacions, :declaracions_ce_ascensors
  json.url checklist_nou_unifamiliar_url(checklist_nou_unifamiliar, format: :json)
end
