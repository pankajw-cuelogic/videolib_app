class AddItemVideoToVideo < ActiveRecord::Migration[5.1]
    def change
    create_table :videos do |t|
      t.string :video_title
      t.string :video_url
      t.string :category
      t.string :composer
      t.string :is_available
      t.timestamps
    end
  end
end
