class AddRespostaFacturaToPagaments < ActiveRecord::Migration
  def change
  	add_column :pagaments, :resposta_factura, :text 
  end
end
