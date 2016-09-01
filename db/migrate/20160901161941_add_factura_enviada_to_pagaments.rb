class AddFacturaEnviadaToPagaments < ActiveRecord::Migration
  def change
    add_column :pagaments, :factura_enviada, :boolean
  end
end
