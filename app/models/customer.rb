class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :deliveries, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy

  # add validation
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :furigana_first_name, presence: true
  validates :furigana_last_name, presence: true
  
  def full_name
    last_name+first_name
  end

  def furigana_full_name
    furigana_last_name+furigana_first_name
  end
  # 退会ユーザーをログインできなくする処理
  def active_for_authentication?
    super && (self.is_deleted == false)
  end
  # 検索機能 フルネーム検索ができない。。
  def self.search(search, word)
    @customers = Customer.where("last_name LIKE? OR first_name LIKE? ","%#{word}%","%#{word}%")
  end
end
