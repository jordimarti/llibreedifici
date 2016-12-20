json.array!(@checklist_nou_terciaris) do |checklist_nou_terciari|
  json.extract! checklist_nou_terciari, :id, :edifici_id, :llicencies_preceptives, :certificat_final_obra, :acta_recepcio_obra, :escriptura_publica, :documents_garantia, :certificacio_energetica, :polissa_assegurances, :carregues_reals, :documents_complementaris, :documents_acreditatius_ajuts, :documents_justificacio_operacions, :declaracions_ce_ascensors
  json.url checklist_nou_terciari_url(checklist_nou_terciari, format: :json)
end
