class CreateWorkflowhistories < ActiveRecord::Migration
  def change
    create_table :workflowhistories do |t|
      t.integer :workflow_id
      t.integer :user_id
      t.string :content
      t.string :remark
      
      t.timestamps
    end
  end
end
