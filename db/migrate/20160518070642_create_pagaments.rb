class CreatePagaments < ActiveRecord::Migration
  def change
    create_table :pagaments do |t|
      t.integer :user_id
      t.integer :edifici_id
      t.integer :numorder
      t.string :import
      t.string :codi_retorn
      t.string :codi_autoritzacio

      t.timestamps null: false
    end
  end
end
