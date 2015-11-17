class CreateIites < ActiveRecord::Migration
  def change
    create_table :iites do |t|
      t.integer :edifici_id
      t.string :referencia
      t.string :data

      t.timestamps null: false
    end
  end
end
