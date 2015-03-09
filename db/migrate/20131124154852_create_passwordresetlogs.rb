class CreatePasswordresetlogs < ActiveRecord::Migration
  def change
    create_table :passwordresetlogs do |t|
      t.integer :user_id
      t.string :confirm_code
      t.string :mobile
      t.integer :status

      t.timestamps
    end
  end
end
