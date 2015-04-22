# encoding: utf-8
class Readnotice < ActiveRecord::Base
  attr_accessible :notice_id, :user_id

  belongs_to :notice
  belongs_to :user
end

# == Schema Information
#
# Table name: readnotices
#
#  id         :integer          not null, primary key
#  notice_id  :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
