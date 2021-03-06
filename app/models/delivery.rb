class Delivery < ApplicationRecord
  belongs_to :customer

  validates :name, presence: true
  validates :postcode, format: {with: /\A\d{7}\z/, message: 'は7文字を入力してください'}
  validates :address, presence: true

  def delivery_together
    "〒" + self.postcode.to_s + " " + self.address.to_s + " " + self.name.to_s
  end


end