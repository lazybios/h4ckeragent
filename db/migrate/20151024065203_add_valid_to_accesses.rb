class AddValidToAccesses < ActiveRecord::Migration
  def change
    add_column :accesses, :invalid, :boolean, :default => false
    change_column :accesses, :click_count, :integer, :default => 0
  end
end
