class CreateDeclaracions < ActiveRecord::Migration
  def change
    create_table :declaracions do |t|
      t.integer :edifici_id
      t.string :notari
      t.string :n_protocol
      t.string :data_declaracio

      t.timestamps null: false
    end
  end
end
