class Product < ApplicationRecord

  belongs_to :genre
  has_many :order_items, dependent: :destroy
  has_many :cart_items, dependent: :destroy

  attachment :image

  validates :name, presence: true
  validates :description, presence: true
  # numericality〜整数のみというバリデーションらしいので記述
  validates :price, presence: true, numericality: { only_integer: true }
	
def subtotal
  cart_item.product_count * price
end
end
