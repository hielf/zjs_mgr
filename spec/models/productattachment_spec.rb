require 'spec_helper'

describe Productattachment do
  pending "add some examples to (or delete) #{__FILE__}"
end

# == Schema Information
#
# Table name: productattachments
#
#  id          :integer          not null, primary key
#  product_id  :integer
#  file_name   :string(255)
#  file_type   :string(255)
#  file_binary :binary
#  order       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
