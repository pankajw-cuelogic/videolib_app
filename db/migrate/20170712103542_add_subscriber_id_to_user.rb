class AddSubscriberIdToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :subscription_id, :integer
  end
end
