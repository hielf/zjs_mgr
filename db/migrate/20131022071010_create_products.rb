class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :product_code
      t.string :name
      t.string :manager
      t.integer :product_type
      t.integer :risk_level
      t.string :sale_limit
      t.string :returns_ratio
      t.date :sale_begin_date
      t.date :sale_end_date
      t.date :manage_begin_date
      t.date :manage_end_date
      t.string :product_structure
      t.string :begin_limit
      t.string :sales_bonus
      t.integer :product_income
      t.integer :status
      t.string :linkman
      t.string :phone
      t.string :capital_account
      t.string :contract
      t.string :instruction

      t.timestamps
    end
  end
end
