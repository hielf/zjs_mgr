class Custbrokerrel < ActiveRecord::Base
  attr_accessible :broker_id, :cust_id, :rel_status, :rel_date, :dis_ratio

  belongs_to :broker
  belongs_to :cust
end

# == Schema Information
#
# Table name: custbrokerrels
#
#  id         :integer          not null, primary key
#  broker_id  :integer
#  cust_id    :integer
#  rel_status :integer
#  rel_date   :string(8)
#  dis_ratio  :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
