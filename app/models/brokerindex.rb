class Brokerindex < ActiveRecord::Base
  belongs_to :broker
  
  default_scope :order => 'brokerindices.month_id'
  
end

# == Schema Information
#
# Table name: brokerindices
#
#  id         :integer          not null, primary key
#  broker_id  :integer
#  month_id   :string(255)
#  indextype  :integer
#  occursum   :decimal(, )
#  remark     :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
