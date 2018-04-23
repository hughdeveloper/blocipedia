FactoryBot.define do

  factory :user do
    username "bloc"
    email "bloc@blocipedia.com"
    password "password"
    confirmed_at { Faker::Time.between(2.days.ago, Date.today, :all) }
    confirmation_sent_at { Faker::Time.between(2.days.ago, 1.days.ago, :all)}
  end
end
