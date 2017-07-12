class AddColumnsToSubscriber < ActiveRecord::Migration[5.1]
  def change
    add_column :subscribers, :plan_code, :string
    add_column :subscribers, :no_of_videos, :int
    add_column :subscribers, :expiry_in_days, :int
    add_column :subscribers, :is_active, :bool
    add_column :subscribers, :subscription_cost, :integer
  end
end
