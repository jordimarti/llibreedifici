class Edifici < ActiveRecord::Base

	belongs_to :user
	has_one :identificacio
	
	has_many :promotors
	has_many :projectistes
	has_many :constructors
	has_many :directors
	has_many :execucio_directors
	has_many :laboratoris
	has_many :entitat_controls
	has_many :subministradors
	has_many :industrials
	has_many :colaboradors
	has_many :coordinadors

	has_many :llicencies
	has_many :declaracions
	has_many :regim_propietats
	has_many :regim_especials
	has_many :carregues
	has_many :entitats
	has_many :garantia_promotors
	has_many :garantia_constructors
	has_many :garantia_instalacions
	has_many :energia_certificats
	has_many :aptitud_certificats
	has_many :iites

	has_many :sistemes
	has_one :fonamentacio
	has_one :estructura
	has_one :tancaments_vertical
	has_one :coberta
	has_one :particio
	has_one :sanejament
	has_one :aigua
	has_one :electricitat
	has_one :climatitzacio
	has_one :ga
	has_one :ventilacio
	has_one :incendi
	has_one :ascensor
	has_one :telecomunicacio
	has_one :especial

	has_many :elements
	has_many :referencies
	has_many :referencia_calendaris

	has_one :checklist_nou_plurifamiliar
	has_one :checklist_nou_unifamiliar
	has_one :checklist_existent_plurifamiliar
	has_one :checklist_nou_terciari

	has_one :info_usuari
	has_one :pagament
	has_many :usuari_factures
	has_many :empresa_factures

	has_many :signatura_promotors
	has_many :signatura_llibres
	has_many :signatura_instruccions

	validates :nom_edifici, :presence => true
	validates :tipus_edifici, :presence => true
	validates :ref_cadastral, :presence => true

end
