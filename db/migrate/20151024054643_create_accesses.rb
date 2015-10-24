class CreateAccesses < ActiveRecord::Migration
  def change
    create_table :accesses do |t|
      t.string :passcode
      t.string :remark
      t.integer :user_id
      t.integer :resume_id
      t.string :sharecode
      t.datetime :expire_at
      t.integer :click_count

      t.timestamps null: false
    end
  end
end
