class AddBodyOriginResumes < ActiveRecord::Migration
  def change
    add_column :resumes, :body_origin, :text
  end
end
