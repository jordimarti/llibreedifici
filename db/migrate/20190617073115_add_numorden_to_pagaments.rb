class AddNumordenToPagaments < ActiveRecord::Migration
  def change
  	add_column :pagaments, :numorden, :string
  end
end
