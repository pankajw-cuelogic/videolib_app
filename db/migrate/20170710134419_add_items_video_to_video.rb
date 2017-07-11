class AddItemsVideoToVideo < ActiveRecord::Migration[5.1]
  def change
  	add_attachment :videos, :item_video
  end
end
