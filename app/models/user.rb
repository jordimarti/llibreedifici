class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :edificis
  has_many :pagaments
	#after_create :subscribe

	validates :first_name, :presence => true
	validates :last_name, :presence => true
	validates :nif, :presence => true
  validates :role, :presence => true

  def name
  	[first_name, last_name].compact.join(' ')
  end

  def subscribe
  	gibbon = Gibbon::Request.new(api_key: Rails.application.secrets.mailchimp_api_key)
  	list_id = Rails.application.secrets.mailchimp_list_id
  	gibbon.lists(list_id).members.create(body: {email_address: self.email, status: "subscribed", merge_fields: {FNAME: self.first_name, LNAME: self.last_name}})
  end
  
end
