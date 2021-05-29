# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
    email: 'admin@admin.com',
    password: 'admintest'
  )
  
10.times do |n|
    Customer.create!(
        email: "test#{ n+1 }@gmail.com",
        password: "test#{ n+1 }tarou",
        first_name: "テスト",
        last_name: "太郎#{ n+ 1}",
        furigana_first_name: "テスト",
        furigana_last_name: "タロウ#{ n+1 }",
        phone_number: "000000000#{n+1}",
        postcode: "000000#{n+1}",
        address: "東京都渋谷区#{n+1}"
        )
    
    Genre.create!(name: "ジャンル#{n+1}")    
    
    Product.create!(
        genre_id: n+1,
        name: "商品番号#{n+1}",
        description: "商品説明#{n+1}商品説明#{n+1}商品説明#{n+1}",
        image: File.open("./app/assets/images/img/naganocake_image#{n+1}.jpg"),
        price: (n+1)*111,
        is_active: "販売中"
        )
end
 
 