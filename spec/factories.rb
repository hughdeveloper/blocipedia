FactoryBot.define do
  factory :collaborator do
    user nil
    wiki nil
  end
  factory :wiki do
    title { Faker::String.random(3..12) }
    body { Faker::String.random(100..500) }
    private false
    user nil
  end

  factory :user do
    username "bloc"
    email "bloc@blocipedia.com"
    password "password"
    confirmed_at { Faker::Time.between(2.days.ago, Date.today, :all) }
    confirmation_sent_at { Faker::Time.between(2.days.ago, 1.days.ago, :all)}
  end

  factory :user4 do
    username "bloc"
    email "bloc@blocipedia.com"
    password "password"
    confirmed_at { Faker::Time.between(2.days.ago, Date.today, :all) }
    confirmation_sent_at { Faker::Time.between(2.days.ago, 1.days.ago, :all)}
  end

end
