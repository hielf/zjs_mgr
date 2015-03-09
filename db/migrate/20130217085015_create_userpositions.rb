class CreateUserpositions < ActiveRecord::Migration
  def change
    create_table :userpositions do |t|
      t.string :name

      t.timestamps
    end
  end
end
