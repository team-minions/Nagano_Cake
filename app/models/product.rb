class Product < ApplicationRecord

  belongs_to :genre
  has_many :order_items, dependent: :destroy
  has_many :cart_items, dependent: :destroy

  attachment :image

  validates :name, presence: true
  validates :description, presence: true
  # numericality〜整数のみというバリデーションらしいので記述
  validates :price, presence: true, numericality: { only_integer: true }
	

# 税込価格の表記
  def add_tax_price
   (self.price * 1.10).round
  end

end
