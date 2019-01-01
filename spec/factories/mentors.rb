FactoryBot.define do
  factory :mentor do
    user
    name { Faker::TheITCrowd.character }
    email { Faker::Internet.email }
    city { "Denver" }
    state { "CO" }
    slack_username { "slack_username" }
    matched { false }
    active { true }
    current_title {""}
    current_employer {""}
    background {""}
    industries { [] }
    ways_to_mentor { [] }
    expertise_tech { [] }
    expertise_non_tech { [] }
    stack_preference { [] }
    identity_preference { [] }
    mentee_capacity { 1 }
    meeting_location {""}
    country {""}
  end
end
