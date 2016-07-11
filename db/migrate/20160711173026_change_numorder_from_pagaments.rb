class ChangeNumorderFromPagaments < ActiveRecord::Migration
  def change
  	change_column :pagaments, :numorder, :string
  end
end
