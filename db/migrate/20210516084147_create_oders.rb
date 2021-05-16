class CreateOders < ActiveRecord::Migration[5.2]
  def change
    create_table :oders do |t|
      t.integer :shipping_fee
      t.integer :customer_id

      t.timestamps
    end
  end
end
