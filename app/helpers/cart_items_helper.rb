module CartItemsHelper
  def number_to_currency(price)
    "#{price.to_s(:delimited, delimiter: ',')}"
  end
end
