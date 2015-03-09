class CreateWorkflows < ActiveRecord::Migration
  def change
    create_table :workflows do |t|
      t.string :code
      t.string :name
      t.integer :steps

      t.timestamps
    end
  end
end
