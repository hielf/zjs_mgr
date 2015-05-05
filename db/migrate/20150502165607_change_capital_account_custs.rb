class ChangeCapitalAccountCusts < ActiveRecord::Migration
  def up
    change_column :custs, :capital_account, :string, :limit => 11
    add_column :custs, :cust_type, :string
    remove_column :custs, :branch_id
  end

  def down
  end
end
