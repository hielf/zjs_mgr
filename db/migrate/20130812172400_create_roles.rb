class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :role_name
      t.integer :status
      t.string :memo

      t.timestamps
    end
  end
end
