class Brokerproductrel < ActiveRecord::Base
  attr_accessible :broker_id, :product_id
  
  belongs_to :broker
  belongs_to :product
  
  validates :broker_id, :presence => true
  validates :product_id, :presence => true
end

# == Schema Information
#
# Table name: brokerproductrels
#
#  id         :integer          not null, primary key
#  broker_id  :integer
#  product_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
