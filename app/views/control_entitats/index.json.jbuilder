json.array!(@control_entitats) do |control_entitat|
  json.extract! control_entitat, :id, :edifici_id, :nom_entitat_control, :nif_entitat_control, :tipus_via_entitat_control, :via_entitat_control, :numero_entitat_control, :bloc_entitat_control, :escala_entitat_control, :pis_entitat_control, :cp_entitat_control, :poblacio_entitat_control, :provincia_entitat_control, :pais_entitat_control
  json.url control_entitat_url(control_entitat, format: :json)
end