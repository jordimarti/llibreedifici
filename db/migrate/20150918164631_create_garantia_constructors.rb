class CreateGarantiaConstructors < ActiveRecord::Migration
  def change
    create_table :garantia_constructors do |t|
      t.integer :edifici_id
      t.string :venciment
      t.string :tipus
      t.string :referencia

      t.timestamps null: false
    end
  end
end
