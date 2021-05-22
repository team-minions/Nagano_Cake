class ChangeIsActiveOfProducts < ActiveRecord::Migration[5.2]
  
  def up
    change_column :products, :is_active, :boolean, default: false, null: false
  end

  def down
    change_column :products, :is_active, :boolean
  end
end
