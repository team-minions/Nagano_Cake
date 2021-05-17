class CreateOders < ActiveRecord::Migration[5.2]
  def change
    create_table :oders do |t|
      t.integer :shipping_fee
      t.integer :customer_id
      t.integer :pay_amount
      t.integer :pay_method
      t.string :delivery_name
      t.string :delivery_postcode
      t.string :delivery_address
      t.integer :status

      t.timestamps
    end
  end
end
