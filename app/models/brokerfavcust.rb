class Brokerfavcust < ActiveRecord::Base
  attr_accessible :broker_id, :cust_id

  belongs_to :broker
  belongs_to :cust
end

# == Schema Information
#
# Table name: brokerfavcusts
#
#  id         :integer          not null, primary key
#  broker_id  :integer
#  cust_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
