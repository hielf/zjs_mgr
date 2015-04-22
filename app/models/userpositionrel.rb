# encoding: utf-8
class Userpositionrel < ActiveRecord::Base
  attr_accessible :expiredate, :positionid, :userid
  
  belongs_to :position, :class_name => "Userposition", :foreign_key => "positionid"
  belongs_to :user, :class_name => "User", :foreign_key => "userid"
  
  validates :userid, :presence => true
  validates :positionid, :presence => true
end

# == Schema Information
#
# Table name: userpositionrels
#
#  id         :integer          not null, primary key
#  userid     :integer
#  positionid :integer
#  expiredate :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
