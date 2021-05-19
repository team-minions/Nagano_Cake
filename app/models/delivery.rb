class Delivery < ApplicationRecord
  belongs_to :customer
  
  validates :name, presence: true
  validates :postcode, presence: true, format: {with: /\A\d{7}\z/}
  validates :adress, presence: true
end
