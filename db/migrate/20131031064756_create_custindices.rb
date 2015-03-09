class CreateCustindices < ActiveRecord::Migration
  def change
    create_table :custindices do |t|
      t.integer :cust_id
      t.integer :month_id
      t.float :total_asset
      t.float :stock_asset
      t.float :rzrq_end_asset
      t.float :bj_balance
      t.float :fd_balance
      t.float :lh_balance
      t.float :total_match_balance
      t.float :stock_match_balance
      t.float :rzrq_g_match_balance
      t.float :rzrq_j_match_balance
      t.float :total_commis
      t.float :stock_commis
      t.float :rzrq_g_commis
      t.float :rzrq_j_commis

      t.timestamps
    end
  end
end
