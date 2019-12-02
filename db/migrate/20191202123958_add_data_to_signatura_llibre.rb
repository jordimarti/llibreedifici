class AddDataToSignaturaLlibre < ActiveRecord::Migration
  def change
    add_column :signatura_llibres, :poblacio_signatura, :string
    add_column :signatura_llibres, :dia_signatura, :string
    add_column :signatura_llibres, :mes_signatura, :string
    add_column :signatura_llibres, :any_signatura, :string
  end
end
