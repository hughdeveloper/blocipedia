FactoryBot.define do

  factory :user do
    username "Bloc"
    email "bloc@blocipedia.com"
    password "password"
    password_confirmation 'password'
  end
end
