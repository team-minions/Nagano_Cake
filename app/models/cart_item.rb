class CartItem < ApplicationRecord

  belongs_to :product
  belongs_to :customer


def subtotals
  cart_items.map do |i| i.subtotal end
end

end
