# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


for i in 1..10
    user = User.create(
        email: Faker::Internet.email,
        password: Faker::Internet.password(min_length: 8, max_length: 15),
        name: Faker::Name.name,
        address: Faker::Address.full_address,
    )

    puts "Created user #{user.name}"
end 

for i in 1..20
    user = User.order('RANDOM()').first
    coin = Coin.create(
        user_id: user.id,
        denomination: ["half penny", "penny", "three pence", "six pence", "shilling", "florin", "crown"].sample,
        description: Faker::Lorem.paragraph,
        price: rand(300..5000),
        condition: rand(0..5),
        post_decimal: false,
        mint_year: rand(1901..1964)
    )
    puts "Created #{coin.denomination} coin for #{user.name}."
end

for i in 1..20
    user = User.order('RANDOM()').first
    coin = Coin.create(
        user_id: user.id,
        denomination: ["5 cents","10 cents","20 cents","50 cents","1 dollar","2 dollars"].sample,
        description: Faker::Lorem.paragraph,
        price: rand(300..5000),
        condition: rand(0..5),
        post_decimal: true,
        mint_year: rand(1966..2019))
    puts "Created #{coin.denomination} coin for #{user.name}."
end
coin_ids = Coin.all.pluck(:id)
unique_coin_ids = []
    while unique_coin_ids.length < 20
        unique_coin_ids << coin_ids.sample
        unique_coin_ids = unique_coin_ids.uniq
    end 
for i in 0...20
    user = User.order('RANDOM()').first
    coin = Coin.order('RANDOM()').first
    payment = Payment.create(
    user_id: user.id,
        coin_id: unique_coin_ids[i]
    )
    puts "Created payment #{coin.denomination} for #{user.name}"
end 

