class CreateWorkflowunderways < ActiveRecord::Migration
  def change
    create_table :workflowunderways do |t|
      t.integer :user_id
      t.integer :workflow_id
      t.integer :step
      t.string  :content
      t.string  :remark

      t.timestamps
    end
  end
end
