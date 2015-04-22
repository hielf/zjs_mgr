# == Schema Information
#
# Table name: branchindices
#
#  id         :integer          not null, primary key
#  branch_id  :integer
#  month_id   :string(255)
#  indextype  :integer
#  occursum   :decimal(, )
#  remark     :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Branchindex < ActiveRecord::Base
  belongs_to :department
  
  default_scope   :order => 'branchindices.month_id'
end
