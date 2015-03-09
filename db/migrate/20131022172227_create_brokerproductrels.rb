class CreateBrokerproductrels < ActiveRecord::Migration
  def change
    create_table :brokerproductrels do |t|
      t.integer :broker_id
      t.integer :product_id

      t.timestamps
    end
  end
end
