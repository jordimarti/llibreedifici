class CreateCarregues < ActiveRecord::Migration
  def change
    create_table :carregues do |t|
      t.integer :edifici_id
      t.string :tipus_carrega
      t.string :document_carrega

      t.timestamps null: false
    end
  end
end
