class AddNumclientToEmpresaFactura < ActiveRecord::Migration
  def change
    add_column :empresa_factures, :numclient, :string
  end
end
