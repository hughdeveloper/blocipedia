# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'random_data'

admin = User.create!(
  username:     'Admin',
  email:    'admin@example.com',
  password: 'helloworld',
  role: 2,
  confirmed_at: '2018-01-01',
  confirmation_sent_at: '2018-01-01'
)

free = User.create!(
  username:     'free',
  email:    'free@example.com',
  password: 'helloworld',
  role: 0,
  confirmed_at: '2018-01-01',
  confirmation_sent_at: '2018-01-01'
)

premium = User.create!(
  username:     'premium',
  email:    'premium@example.com',
  password: 'helloworld',
  role: 1,
  confirmed_at: '2018-01-01',
  confirmation_sent_at: '2018-01-01'
)

10.times do
   User.create!(
     username: RandomData.random_name,
     email: RandomData.random_email,
     password: RandomData.random_sentence,
     role: 0,
     confirmed_at: '2018-01-01',
     confirmation_sent_at: '2018-01-01'
   )
 end
 users = User.all



50.times do
  Wiki.create!(
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph,
    private: false,
    user: users.sample
  )
end

wikis = Wiki.all



puts "Seed finished"
puts "#{Wiki.count} wiki's created"
