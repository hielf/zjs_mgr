class CreateUserpositionrels < ActiveRecord::Migration
  def change
    create_table :userpositionrels do |t|
      t.integer :userid
      t.integer :positionid
      t.date :expiredate

      t.timestamps
    end
  end
end
