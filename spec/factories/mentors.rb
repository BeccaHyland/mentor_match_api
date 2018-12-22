FactoryBot.define do
  factory :mentor do
    name {Faker::TheITCrowd.character}
    email {Faker::Internet.email}
    city { "Denver" }
    state { "CO" }
    slack_username { "slack_username" }
    matched { false }
    active { true }
  end
end
