# encoding: utf-8
class Workflowunderway < ActiveRecord::Base
  attr_accessible :content, :workflow_id, :remark, :step, :user_id, :custservvisit_attributes
  
  belongs_to :workflow
  has_one :custservvisit
  
  accepts_nested_attributes_for :custservvisit
end

# == Schema Information
#
# Table name: workflowunderways
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  workflow_id :integer
#  step        :integer
#  content     :string(255)
#  remark      :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
