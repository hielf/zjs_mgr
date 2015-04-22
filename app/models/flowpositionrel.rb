class Flowpositionrel < ActiveRecord::Base
  # attr_accessible :position, :step, :flowid
  # 
  # belongs_to :position, :class_name => "Userposition", :foreign_key => "position"
  # belongs_to :workflow, :class_name => "Workflow",     :foreign_key => "flowid"
  # 
  # validates :position, :presence => true
  # validates :step,     :presence => true
  # validates :flowid,   :presence => true  
  # 
  # default_scope   :order => 'flowpositionrels.step' 
end

# == Schema Information
#
# Table name: flowpositionrels
#
#  id         :integer          not null, primary key
#  step       :integer
#  position   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  flowid     :integer
#
