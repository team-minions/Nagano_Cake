class ChangeOderItemsToOrderItems < ActiveRecord::Migration[5.2]
  def change
    rename_table :oder_items, :order_items
  end
end
