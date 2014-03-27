# == Schema Information
#
# Table name: items
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  condition   :string(255)
#  description :text
#  image       :text
#  price_range :integer
#  created_at  :datetime
#  updated_at  :datetime
#  sale_id     :integer
#

class Item <ActiveRecord::Base
    attr_accessible :title, :condition, :description, :image, :price_range, :sale_id
    belongs_to :sale
end
