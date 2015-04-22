require 'spec_helper'

describe Custbrokerrel do
  pending "add some examples to (or delete) #{__FILE__}"
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
