require 'spec_helper'

describe Systemtasklog do
  pending "add some examples to (or delete) #{__FILE__}"
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
