class Order < ApplicationRecord
  
  belongs_to :customer
  belongs_to :product
  has_many :order_items, dependent: :destroy
  
  # 注文ステータス
  enum status: { "入金待ち": 0, "入金確認": 1, "制作中": 2, "発送準備中": 3, "発送済み": 4 }
  
end
