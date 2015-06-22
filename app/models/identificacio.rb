class Identificacio < ActiveRecord::Base
	has_attached_file :planol_emplacament, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :planol_emplacament, :content_type => /\Aimage\/.*\Z/

  has_attached_file :foto_facana, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :foto_facana, :content_type => /\Aimage\/.*\Z/

	belongs_to :edifici


end