# encoding: utf-8
class Role < ActiveRecord::Base
  attr_accessible :memo, :name, :status
  
  has_many :assignments
  has_many :users, :through => :assignments
  
  validates :name,  :presence => true, 
                    :length => { :maximum => 20 },
                    :uniqueness => true
end

# == Schema Information
#
# Table name: roles
#
#  id         :integer          not null, primary key
#  status     :integer
#  memo       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string(255)
#
