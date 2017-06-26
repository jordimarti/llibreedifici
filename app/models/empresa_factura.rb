class EmpresaFactura < ActiveRecord::Base

	belongs_to :edifici

	validates :nif, presence: true

end
