class Genre < ApplicationRecord

  has_many :products, dependent: :destroy
  
  def self.search(search, word)
    @genres = Genre.where("name LIKE?","%#{word}%")
  end

  def self.searchgenre(word)
    where(["name LIKE?", "%#{word}%"])
  end
  
end
