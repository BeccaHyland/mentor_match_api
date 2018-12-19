# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Mentor.destroy_all

if Rails.env == 'development' || Rails.env == 'production'
  Mentor.create!([{
    name: "Mary Berry",
    email: "mb@gmail.com",
    city: "San Francisco",
    state: "CA",
    slack_username: "mb@slack.com",
    linkedin_username: "mb@linked_in.com",
    github_username: "mb@github.com",
    matched: true,
    active: true,
    program: "BE"
    },

    {
    name: "Paul Hollywood",
    email: "ph@gmail.com",
    city: "San Francisco",
    state: "CA",
    slack_username: "ph@slack.com",
    linkedin_username: "ph@linked_in.com",
    github_username: "ph@github.com",
    matched: true,
    active: true,
    program: "BE"
    },
    {
    name: "Susan Mel",
    email: "sm@gmail.com",
    city: "San Francisco",
    state: "CA",
    slack_username: "sm@slack.com",
    linkedin_username: "sm@linked_in.com",
    github_username: "sm@github.com",
    matched: true,
    active: true,
    program: "BE"
    }])
end