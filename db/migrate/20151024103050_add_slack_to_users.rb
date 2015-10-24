class AddSlackToUsers < ActiveRecord::Migration
  def change
    add_column :users, :slack_webhook, :string, :default => ''
    add_column :users, :slack_channel, :string, :default => ''
  end
end
