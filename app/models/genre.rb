class Genre < ApplicationRecord

  has_many :products, dependent: :destroy
  
  def self.searchgenre(word)
    where(["name LIKE?", "%#{word}%"])
  end
  
end
