require 'spec_helper'

describe Workflowstep do
  pending "add some examples to (or delete) #{__FILE__}"
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
