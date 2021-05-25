class Genre < ApplicationRecord

  has_many :products, dependent: :destroy
  
<<<<<<< HEAD
  def self.search(search, word)
    @genres = Genre.where("name LIKE?","%#{word}%")
  end

=======
  def self.searchgenre(word)
    where(["name LIKE?", "%#{word}%"])
  end
  
>>>>>>> origin/develop
end
