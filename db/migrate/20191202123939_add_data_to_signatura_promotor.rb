class AddDataToSignaturaPromotor < ActiveRecord::Migration
  def change
    add_column :signatura_promotors, :poblacio_signatura, :string
    add_column :signatura_promotors, :dia_signatura, :string
    add_column :signatura_promotors, :mes_signatura, :string
    add_column :signatura_promotors, :any_signatura, :string
  end
end
