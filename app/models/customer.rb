class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        # 
  def full_name
    first_name+last_name
  end

  def furigana_full_name
    furigana_first_name+furigana_last_name
  end
end
