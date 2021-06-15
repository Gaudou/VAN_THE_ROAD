# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "faker"
puts 'clean db'
Van.destroy_all
User.destroy_all
puts 'create seed db'

names = ["gauderic", "josephine", "marie", "molki"]
names.each do |name|
  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    birth_date: Faker::Date.birthday(min_age: 18, max_age: 65),
    email: "#{name}@email.fr",
    password: "azerty",
    password_confirmation: "azerty",
    user_city: Faker::Address.city,
    )
  puts 'user created'
    van = Van.new(
    name: Faker::Name.name,
    model: Faker::Vehicle.model,
    capacity: ["1", "2", "4", "5", "6"].sample,
    description: Faker::Quote.matz,
    van_city: Faker::Address.city,
    price_per_day: [50, 75, 120].sample,
    )
    van.user = user
    van.save!
  puts 'van created'
end
puts 'done'
