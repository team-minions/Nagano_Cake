class CreateOderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :oder_items do |t|
      t.integer :order_id
      t.integer :product_id
      t.integer :product_count
      t.integer :making_status
      t.integer :price

      t.timestamps
    end
  end
end
