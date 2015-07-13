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

      t.timestamps null: false
    end
  end
end
