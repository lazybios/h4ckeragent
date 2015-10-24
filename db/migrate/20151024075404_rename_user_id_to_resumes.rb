class RenameUserIdToResumes < ActiveRecord::Migration
  def change
    rename_column :resumes, :user_id_, :user_id
  end
end
