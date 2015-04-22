# encoding: utf-8
class Workflowhistory < ActiveRecord::Base
  attr_accessible :content, :workflow_id, :remark, :user_id, :id
  
  belongs_to :workflow
  has_one    :custservvisit, :foreign_key => "workflowunderway_id"
  
  accepts_nested_attributes_for :custservvisit
end

# == Schema Information
#
# Table name: workflowhistories
#
#  id          :integer          not null, primary key
#  workflow_id :integer
#  user_id     :integer
#  content     :string(255)
#  remark      :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
