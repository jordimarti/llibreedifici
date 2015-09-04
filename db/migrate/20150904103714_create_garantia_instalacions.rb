class CreateGarantiaInstalacions < ActiveRecord::Migration
  def change
    create_table :garantia_instalacions do |t|
      t.integer :edifici_id
      t.string :venciment
      t.string :tipus
      t.string :instalacio
      t.string :empresa

      t.timestamps null: false
    end
  end
end
