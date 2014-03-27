# == Schema Information
#
# Table name: sales
#
#  id            :integer          not null, primary key
#  start_time    :time
#  finish_time   :time
#  date          :date
#  price_range   :integer
#  created_at    :datetime
#  updated_at    :datetime
#  street_number :integer
#  street_name   :string(255)
#  suburb        :string(255)
#  state         :string(255)
#  post_code     :integer
#  phone_number  :integer
#  address       :string(255)
#  latitude      :float
#  longitude     :float
#  user_id       :integer
#

class Sale <ActiveRecord::Base
    attr_accessible :start_time, :finish_time, :date, :price_range, :street_number, :street_name, :suburb, :state, :phone_number, :post_code, :address, :longitude, :latitude
	has_many :items
	belongs_to :user

	geocoded_by :suburb
    after_validation :geocode, :if => :suburb_changed?


  	def address
  		"#{suburb}"
  	end
end

