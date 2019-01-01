FactoryBot.define do
  factory :user do
    name { Faker::Friends.character }
    role { "user" }
    login { "login string" }
    avatar_url { "www.myGHphoto.com" }
  end
end
