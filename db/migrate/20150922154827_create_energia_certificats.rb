class CreateEnergiaCertificats < ActiveRecord::Migration
  def change
    create_table :energia_certificats do |t|
      t.integer :edifici_id
      t.string :numero_registre
      t.string :vigencia
      t.string :qualificacio_energetica
      t.decimal :consum_energia_primaria
      t.decimal :emissions_co2

      t.timestamps null: false
    end
  end
end
