class Productattachment < ActiveRecord::Base
  # attr_accessible :file, :file_name, :file_type, :order, :product_id

  belongs_to		:product
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
