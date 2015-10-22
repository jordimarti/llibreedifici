json.array!(@checklist_existent_plurifamiliars) do |checklist_existent_plurifamiliar|
  json.extract! checklist_existent_plurifamiliar, :id, :edifici_id, :iite, :document_lliurament_iite, :comunicat_ens_local, :programa_rehabilitacio, :certificat_final_obra, :certificat_aptitud, :certificacio_energetica, :instruccions_us, :documents_justificatius_operacions, :pressupostos_obres, :certificats_instalacions_comunes, :certificats_inspeccions_tecniques
  json.url checklist_existent_plurifamiliar_url(checklist_existent_plurifamiliar, format: :json)
end
