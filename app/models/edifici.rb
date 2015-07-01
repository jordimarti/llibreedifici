class Edifici < ActiveRecord::Base

	belongs_to :user
	has_one :identificacio
	has_one :checklist_edifici_nou_plurifamiliar
	
	has_many :promotors
	has_many :projectistes
	has_many :constructors
	has_many :directors
	has_many :execucio_directors
	has_many :laboratoris
	has_many :entitat_controls
	has_many :subministradors
	has_many :industrials

	has_many :sistemes
	has_one :fonamentacio
	has_one :estructura
	has_many :referencies

	validates :nom_edifici, :presence => true
	validates :tipus_edifici, :presence => true

end
