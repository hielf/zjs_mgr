# encoding: utf-8
class Systemtasklog < ActiveRecord::Base
  attr_accessible :complete_tasks, :description, :task_date, :task_type, :total_tasks

  scope :recent, unscoped.order('systemtasklogs.task_date DESC').limit(5)
  scope :unfinished, where('total_tasks > complete_tasks')
end

# == Schema Information
#
# Table name: systemtasklogs
#
#  id             :integer          not null, primary key
#  task_date      :datetime
#  total_tasks    :integer
#  complete_tasks :integer
#  task_type      :integer
#  description    :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
