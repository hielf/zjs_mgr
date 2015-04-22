require 'spec_helper'

describe Brokercompliancelog do
  pending "add some examples to (or delete) #{__FILE__}"
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
