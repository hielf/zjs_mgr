# encoding: utf-8
class Session < ActiveRecord::Base
  attr_accessor :usercode, :password
  attr_accessible :login_type, :user_id, :created_at
  
  belongs_to :user

  scope :online, where("created_at >= ?", 120.minutes.ago)
  scope :total_visit, where("created_at >= ?", Date.today)
end

# == Schema Information
#
# Table name: sessions
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  login_type :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
