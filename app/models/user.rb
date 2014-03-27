# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  first_name      :string(255)
#  last_name       :string(255)
#  email_address   :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  password_digest :string(255)
#  address         :text
#  latitude        :float
#  longitude       :float
#

class User <ActiveRecord::Base
    attr_accessible :first_name, :last_name, :email_address, :password, :password_confirmation, :address, :latitude, :longitude
    has_many :sales
    has_many :items, :through => :sales

    has_secure_password
  	validates :first_name, :last_name, :presence => true, :uniqueness => true, :length => { :minimum => 2 }

    geocoded_by :address
    after_validation :geocode, :if => :address_changed?

  	def name
  		"#{first_name} #{last_name}"
  	end
end

