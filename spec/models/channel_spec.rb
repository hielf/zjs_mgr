require 'spec_helper'

describe Channel do
  pending "add some examples to (or delete) #{__FILE__}"
end

# == Schema Information
#
# Table name: channels
#
#  id             :integer          not null, primary key
#  channel_code   :string(255)
#  channel_name   :string(255)
#  channel_type   :integer
#  institution_id :integer
#  status         :boolean
#  remark         :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
