class AddNumFacturaSapToPagaments < ActiveRecord::Migration
  def change
  	add_column :pagaments, :num_factura_sap, :string
  end
end
