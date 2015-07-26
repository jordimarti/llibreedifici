class CreateReferencies < ActiveRecord::Migration
  def change
    create_table :referencies do |t|
      t.integer :edifici_id
      t.integer :operacio_id
      t.string :sistema
      t.boolean :manual_habitatge
      t.boolean :creat_usuari

      t.timestamps null: false
    end
  end
end
