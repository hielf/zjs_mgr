class Channelurl < ActiveRecord::Base
  attr_accessible :url, :channel_id, :branch_id, :serv_branch_id, :broker_id

  belongs_to :channel
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
