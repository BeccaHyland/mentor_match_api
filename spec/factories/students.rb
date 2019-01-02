FactoryBot.define do
  factory :student do
    name {Faker::TheITCrowd.character}
    email {Faker::Internet.email}
    slack_username { "slack_username" }
    matched { false }
    active { true }
    background {""}
    industries { [] }
    stack { [] }
    identity_marker { [] }
  end
end