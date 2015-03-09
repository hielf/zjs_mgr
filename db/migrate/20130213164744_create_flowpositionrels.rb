class CreateFlowpositionrels < ActiveRecord::Migration
  def change
    create_table :flowpositionrels do |t|
      t.integer :step
      t.integer :position

      t.timestamps
    end
  end
end
