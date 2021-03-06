class Identificacio < ActiveRecord::Base
	has_attached_file :planol_emplacament, :styles => { :original => "600x600>", :medium => "300x300>", :thumb => "100x100!" }, :default_url => "https://s3-eu-west-1.amazonaws.com/llibreedifici/missing/missing_emplacament.png"
  validates_attachment_content_type :planol_emplacament, :content_type => /\Aimage\/.*\Z/

  has_attached_file :foto_facana, :styles => { :original => "600x600>", :medium => "300x300>", :thumb => "100x100!" }, :default_url => "https://s3-eu-west-1.amazonaws.com/llibreedifici/missing/missing_facana.png"
  validates_attachment_content_type :foto_facana, :content_type => /\Aimage\/.*\Z/

  has_attached_file :foto_facana_2, :styles => { :original => "600x600>", :medium => "300x300>", :thumb => "100x100!" }, :default_url => "https://s3-eu-west-1.amazonaws.com/llibreedifici/missing/missing_facana.png"
  validates_attachment_content_type :foto_facana, :content_type => /\Aimage\/.*\Z/

  has_attached_file :foto_facana_3, :styles => { :original => "600x600>", :medium => "300x300>", :thumb => "100x100!" }, :default_url => "https://s3-eu-west-1.amazonaws.com/llibreedifici/missing/missing_facana.png"
  validates_attachment_content_type :foto_facana, :content_type => /\Aimage\/.*\Z/

  has_attached_file :logo_empresa, :styles => { :original => "600x600>", :medium => "300x300>", :thumb => "125x25>" }, :default_url => "https://s3-eu-west-1.amazonaws.com/llibreedifici/missing/missing_logo.png"
  validates_attachment_content_type :logo_empresa, :content_type => /\Aimage\/.*\Z/

	belongs_to :edifici


end
