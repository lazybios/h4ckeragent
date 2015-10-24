class RenameInvalidToAccesses < ActiveRecord::Migration
  def change
    rename_column :accesses, :invalid, :is_invalid
  end
end
