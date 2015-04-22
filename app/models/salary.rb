# encoding: utf-8
class Salary < ActiveRecord::Base
  attr_accessible :broker_id, :indextype, :month_id, :occursum, :remark
  
  belongs_to :broker
  
  # default_scope :order => 'salaries.month_id DESC'
  
end

# == Schema Information
#
# Table name: salaries
#
#  id         :integer          not null, primary key
#  month_id   :integer
#  indextype  :integer
#  broker_id  :integer
#  occursum   :decimal(, )
#  remark     :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
