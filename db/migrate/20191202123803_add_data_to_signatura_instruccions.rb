class AddDataToSignaturaInstruccions < ActiveRecord::Migration
  def change
    add_column :signatura_instruccions, :poblacio_signatura, :string
    add_column :signatura_instruccions, :dia_signatura, :string
    add_column :signatura_instruccions, :mes_signatura, :string
    add_column :signatura_instruccions, :any_signatura, :string
  end
end
