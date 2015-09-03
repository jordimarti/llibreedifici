class CreateLlicencies < ActiveRecord::Migration
  def change
    create_table :llicencies do |t|
      t.integer :edifici_id
      t.string :classe
      t.string :data_llicencia

      t.timestamps null: false
    end
  end
end
