class AddUrlToBrokers < ActiveRecord::Migration
  def change
    add_column :brokers, :url, :string
  end
end
