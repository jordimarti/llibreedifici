class CreateGas < ActiveRecord::Migration
  def change
    create_table :gas do |t|
      t.integer :edifici_id
      t.boolean :instalacio_gas
      t.boolean :diposit_aire_lliure
      t.boolean :diposit_enterrat

      t.timestamps null: false
    end
  end
end
