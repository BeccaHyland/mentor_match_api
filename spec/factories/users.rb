FactoryBot.define do
  factory :user do
    name { Faker::Friends.character }
    role { "user" }
    login { Faker::Number.number(5) }
    avatar_url { "www.myGHphoto.com" }
  end
end
