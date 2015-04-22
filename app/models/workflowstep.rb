# encoding: utf-8
class Workflowstep < ActiveRecord::Base
  attr_accessible :memo, :step, :userposition_id, :workflow_id, :name
  
  belongs_to :userposition
  belongs_to :workflow
end

# == Schema Information
#
# Table name: workflowsteps
#
#  id              :integer          not null, primary key
#  step            :integer
#  workflow_id     :integer
#  userposition_id :integer
#  memo            :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  name            :string(255)
#
