require 'spec_helper'

describe Channelurl do
  pending "add some examples to (or delete) #{__FILE__}"
end

# == Schema Information
#
# Table name: channelurls
#
#  id             :integer          not null, primary key
#  url            :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  channel_id     :integer
#  branch_id      :integer
#  serv_branch_id :integer
#  broker_id      :integer
#
