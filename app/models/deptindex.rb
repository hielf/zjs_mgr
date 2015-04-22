# encoding: utf-8
# == Schema Information
#
# Table name: deptindices
#
#  id            :integer          not null, primary key
#  department_id :integer
#  month_id      :string(255)
#  indextype     :integer
#  occursum      :decimal(, )
#  remark        :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Deptindex < ActiveRecord::Base
  belongs_to :department
  
  scope :matchbalance, where(:indextype => 1001)
  scope :commis, where(:indextype => 1002)
  
  default_scope   :order => 'deptindices.month_id'
  
  # private 
  # 
  # def self.total_sum(dept, month)
  #   where("month_id = :month AND department_id = :dept", :month => month, 
  #                                                        :dept => dept).sum(:occursum)
  # end
  # 
  # def self.total_on(month)
  #   where("month_id = ?", month).sum(:occursum)
  # end
  
end

