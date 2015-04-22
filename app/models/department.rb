# encoding: utf-8
# == Schema Information
#
# Table name: departments
#
#  id         :integer          not null, primary key
#  code       :string(255)
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  supervisor :string(255)
#  location   :string(255)
#  phone      :string(255)
#

class Department < ActiveRecord::Base
  attr_accessible :code, :name, :supervisor, :location, :phone
  
  has_many   :users
  has_many   :branches
  has_many   :deptindices
  
  default_scope   :order => 'departments.code'
  
  def to_label
    "#{code} | #{name}"
  end
  
end


