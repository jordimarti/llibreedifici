class UsuariFactura < ActiveRecord::Base

	belongs_to :edifici

	validates :nif, presence: true
	validates :nif, format: { with: /\A[0-9]{8}[A-Za-z]\Z/,
    message: "NIF incorrecte" }

end
