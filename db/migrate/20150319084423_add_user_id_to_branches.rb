class AddUserIdToBranches < ActiveRecord::Migration
  def change
    add_column :branches, :user_id, :integer
  end
end
