json.array!(@empresa_factures) do |empresa_factura|
  json.extract! empresa_factura, :id, :user_id, :edifici_id, :nom_juridic, :adreca, :poblacio, :provincia, :pais, :codi_postal, :email, :tipus_client
  json.url empresa_factura_url(empresa_factura, format: :json)
end
