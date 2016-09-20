class CreateSignaturaInstruccions < ActiveRecord::Migration
  def change
    create_table :signatura_instruccions do |t|
      t.integer :edifici_id
      t.string :autor_instruccions_nom
      t.string :autor_instruccions_titulacio

      t.timestamps null: false
    end
  end
end
