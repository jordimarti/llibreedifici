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
	has_one :checklist_nou_plurifamiliar
	has_one :checklist_nou_unifamiliar

	validates :nom_edifici, :presence => true
	validates :tipus_edifici, :presence => true

end
