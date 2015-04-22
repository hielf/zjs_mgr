class Custbrokerproductrel < ActiveRecord::Base
  attr_accessible :rel_status, :broker_id, :cust_id, :product_id, :rel_date

  belongs_to :broker
  belongs_to :cust
	belongs_to :product
	
end

# == Schema Information
#
# Table name: custbrokerproductrels
#
#  id         :integer          not null, primary key
#  broker_id  :integer
#  cust_id    :integer
#  product_id :integer
#  rel_status :integer
#  rel_date   :string(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
