# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "faker"
puts 'clean db'
Booking.destroy_all
Van.destroy_all
User.destroy_all
puts 'create seed db'

names = ["gauderic", "josephine", "marie", "molki", "Adrien", "Christian", "Bob", "Marc", "Alan", "Victor"]
names.each do |name|
  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    birth_date: Faker::Date.birthday(min_age: 18, max_age: 65),
    email: "#{name}@email.fr",
    password: "azerty",
    password_confirmation: "azerty",
    user_city: ["Lille", "Marseille", "Nantes", "Bordeaux", "Paris", "Lyon"].sample,
    )
  puts 'user created'
    van = Van.new(
    name: Faker::Name.name,
    model: "Volkswagen",
    capacity: ["1", "2", "4", "5", "6"].sample,
    description: Faker::Quote.matz,
    van_city: ["Lille", "Marseille", "Nantes", "Bordeaux", "Paris", "Lyon"].sample,
    price_per_day: [50, 75, 120].sample,
    )
    van.user = user
    van.save!
  puts 'van created'
end

    booking = Booking.new(
    starting_date: Faker::Date.forward(days: rand(0..31)),
    ending_date: Faker::Date.forward(days: rand(32..60))
    )
    booking.user = User.first
    booking.van = Van.last
    booking.save!
    puts 'booking created'

    booking = Booking.new(
    starting_date: Faker::Date.forward(days: rand(0..31)),
    ending_date: Faker::Date.forward(days: rand(32..60))
    )
    booking.user = User.last
    booking.van = Van.first
    booking.save!
    puts 'booking created'
    puts 'done'
