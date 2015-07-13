class CreateClimatitzacions < ActiveRecord::Migration
  def change
    create_table :climatitzacions do |t|
      t.integer :edifici_id
      t.boolean :escalfador_pn_menor_24
      t.boolean :escalfador_pn_24_70
      t.boolean :escalfador_pn_major_70
      t.boolean :caldera_gas_pn_menor_70
      t.boolean :caldera_gas_pn_major_70
      t.boolean :caldera_biomassa
      t.boolean :caldera_solar_termica
      t.boolean :altres_pn_menor_70
      t.boolean :altres_pn_major_70
      t.boolean :clima_pn_menor_12_autonoms
      t.boolean :clima_pn_menor_12_torres
      t.boolean :clima_pn_menor_12_recuperador
      t.boolean :clima_pn_12_70_autonoms
      t.boolean :clima_pn_12_70_torres
      t.boolean :clima_pn_12_70_recuperador
      t.boolean :clima_pn_major_70_autonoms
      t.boolean :clima_pn_major_70_torres
      t.boolean :clima_pn_major_70_recuperador

      t.timestamps null: false
    end
  end
end
