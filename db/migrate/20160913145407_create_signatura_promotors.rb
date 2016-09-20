class CreateSignaturaPromotors < ActiveRecord::Migration
  def change
    create_table :signatura_promotors do |t|
      t.integer :edifici_id
      t.string :promotor_rao_social
      t.string :promotor_nom_representant

      t.timestamps null: false
    end
  end
end
