class CreateVentilacions < ActiveRecord::Migration
  def change
    create_table :ventilacions do |t|
      t.integer :edifici_id
      t.boolean :habitatge_natural_conductes
      t.boolean :habitatge_natural_obertures
      t.boolean :habitatge_mecanica_conductes
      t.boolean :habitatge_mecanica_obertures
      t.boolean :habitatge_mecanica_control
      t.boolean :traster_natural_conductes
      t.boolean :traster_natural_obertures
      t.boolean :traster_mecanica_conductes
      t.boolean :traster_mecanica_obertures
      t.boolean :traster_mecanica_control
      t.boolean :magatzem_natural_conductes
      t.boolean :magatzem_natural_obertures
      t.boolean :magatzem_mecanica_conductes
      t.boolean :magatzem_mecanica_obertures
      t.boolean :magatzem_mecanica_control
      t.boolean :garatge_natural_conductes
      t.boolean :garatge_natural_obertures
      t.boolean :garatge_mecanica_conductes
      t.boolean :garatge_mecanica_obertures
      t.boolean :garatge_mecanica_control
      t.boolean :terciari_monozona
      t.boolean :terciari_multizona
      t.boolean :terciari_hibrid

      t.timestamps null: false
    end
  end
end
