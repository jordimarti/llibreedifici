class CreateElectricitats < ActiveRecord::Migration
  def change
    create_table :electricitats do |t|
      t.integer :edifici_id
      t.boolean :enllumenat_comunitari
      t.boolean :mes_100k
      t.boolean :connexio_terra
      t.boolean :centre_transformacio
      t.boolean :fotovoltaica
      t.boolean :comptador_unic
      t.boolean :comptadors_individuals_habitatge
      t.boolean :comptadors_centralitzats
      t.boolean :terciari_ilum_incandescent
      t.boolean :terciari_ilum_halogena
      t.boolean :terciari_ilum_fluorescent
      t.boolean :terciari_ilum_vapor_mercuri
      t.boolean :terciari_ilum_halogenurs
      t.boolean :terciari_ilum_sodi_baixa_pressio
      t.boolean :terciari_ilum_sodi_alta_pressio
      t.boolean :terciari_ilum_induccio
      t.boolean :terciari_ilum_led
      t.boolean :comptadors_individuals_locals

      t.timestamps null: false
    end
  end
end
