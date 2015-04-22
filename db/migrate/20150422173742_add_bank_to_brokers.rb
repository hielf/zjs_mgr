class AddBankToBrokers < ActiveRecord::Migration
  def change
    add_column :brokers, :bank, :string
    add_column :brokers, :serv_bank, :string
  end
end
