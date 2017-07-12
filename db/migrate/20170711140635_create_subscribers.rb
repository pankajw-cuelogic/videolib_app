class CreateSubscribers < ActiveRecord::Migration[5.1]
  def change
    create_table :subscribers do |t|
      t.string :plan_name
      t.integer :validity

      t.timestamps
    end
  end
end
