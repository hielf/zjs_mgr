require 'spec_helper'

describe Custservvisit do
  pending "add some examples to (or delete) #{__FILE__}"
end

# == Schema Information
#
# Table name: custservvisits
#
#  id                  :integer          not null, primary key
#  cust_id             :integer
#  cust_name           :string(255)
#  plan_location       :string(255)
#  plan_date           :datetime
#  visit_date          :datetime
#  visit_location      :string(255)
#  attchment_file      :string(255)
#  user_id             :integer
#  assit_user_id       :integer
#  status              :integer
#  visit_content       :string(255)
#  memo                :string(255)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  workflowunderway_id :integer
#
