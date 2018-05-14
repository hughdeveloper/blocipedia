# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'random_data'
require 'faker'

admin = User.create!(
  username:     'Admin',
  email:    'admin@example.com',
  password: 'helloworld',
  role: 2,
  confirmed_at: '2018-01-01',
  confirmation_sent_at: '2018-01-01'
)

free = User.create!(
  username:     'Free',
  email:    'free@example.com',
  password: 'helloworld',
  confirmed_at: '2018-01-01',
  confirmation_sent_at: '2018-01-01'
)

premium = User.create!(
  username:     'Premium',
  email:    'premium@example.com',
  password: 'helloworld',
  role: 1,
  confirmed_at: '2018-01-01',
  confirmation_sent_at: '2018-01-01'
)

10.times do
   User.create!(
     username: Faker::Internet.user_name,
     email: Faker::Internet.email,
     password: Faker::Internet.password(10),
     confirmed_at: '2018-01-01',
     confirmation_sent_at: '2018-01-01'
   )
 end
 users = User.all



50.times do
  Wiki.create!(
    title: Faker::String.random(3..12),
    body: Faker::String.random(100..500),
    private: false,
    user: users.sample
  )
end

wikis = Wiki.all



puts "Seed finished"
puts "#{Wiki.count} wikis created"
puts "#{User.count} users created"
