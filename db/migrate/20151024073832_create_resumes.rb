class CreateResumes < ActiveRecord::Migration
  def change
    create_table :resumes do |t|
      t.string :title
      t.string :url
      t.text :body
      t.integer :user_id_

      t.timestamps null: false
    end
  end
end
