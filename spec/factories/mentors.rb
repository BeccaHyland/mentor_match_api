FactoryBot.define do
  factory :mentor do
    name {Faker::TheITCrowd.character}
    email {Faker::TheITCrowd.email}
    city { "Denver" }
    state { "CO" }
    slack_username { Faker::Cat.name }
    linkedin_username { "linkedin_username" }
    github_username { "github_username" }
    matched { Faker::Boolean.boolean }
  end
end