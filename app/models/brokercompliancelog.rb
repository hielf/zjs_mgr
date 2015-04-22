class Brokercompliancelog < ActiveRecord::Base
  attr_accessible :broker_id, :compliance_type, :occur_date, :occur_sum
end

# == Schema Information
#
# Table name: brokercompliancelogs
#
#  id              :integer          not null, primary key
#  broker_id       :integer
#  compliance_type :integer
#  occur_sum       :integer
#  occur_date      :datetime
#  user_id         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  month_id        :integer
#  remark          :string(255)
#
