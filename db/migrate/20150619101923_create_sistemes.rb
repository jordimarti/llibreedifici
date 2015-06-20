class CreateSistemes < ActiveRecord::Migration
  def change
    create_table :sistemes do |t|
      t.integer :edifici_id
      t.string :nom_sistema
      t.string :pare_sistema

      t.timestamps null: false
    end
  end
end
