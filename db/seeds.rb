# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
MentorPreference.destroy_all
Preference.destroy_all
Mentor.destroy_all

if Rails.env == 'development' || Rails.env == 'production'
  mentor1 = Mentor.create!(
    name: "Mary Berry",
    email: "mb@gmail.com",
    city: "San Francisco",
    state: "CA",
    country: "Great Britain",
    slack_username: "mb@slack.com",
    matched: true,
    active: true,
    pronouns: "she/her",
    current_title: "Judge #1",
    current_employer: "BBC",
    industries: ["Hospitality", "Law & Order"],
    background: "I am one tough cookie.",
    ways_to_mentor: ["1-to-1", "resume & cover letter"],
    expertise_tech: ["none"],
    expertise_non_tech: ["baking", "coaching"],
    mentee_capacity: 10,
    meeting_location: "Great Britain",
    stack_preference: "BE",
    identity_preference: ["veteran", "female-identifying"]
  )

  mentor2 = Mentor.create!(
    name: "Paul Hollywood",
    email: "ph@gmail.com",
    city: "San Francisco",
    state: "CA",
    country: "Great Britain",
    slack_username: "ph@slack.com",
    matched: false,
    active: true,
    pronouns: "she/her",
    current_title: "Judge #1",
    current_employer: "BBC",
    industries: ["Hospitality", "Law & Order"],
    background: "Saying what needs to be said.",
    ways_to_mentor: ["group sessions", "resume & cover letter"],
    expertise_tech: ["none"],
    expertise_non_tech: ["flambe-ing", "career coaching"],
    mentee_capacity: 5,
    meeting_location: "Great Britain",
    stack_preference: "FE",
    identity_preference: ["parent"]
  )
  mentor3 = Mentor.create!(
    name: "Susan Mel",
    email: "sm@gmail.com",
    city: "San Francisco",
    state: "CA",
    country: "Great Britain",
    slack_username: "sm@slack.com",
    matched: true,
    active: false,
    pronouns: "she/her",
    current_title: "Host Extraordinaire",
    current_employer: "BBC",
    industries: ["Entertainment", "Counseling"],
    background: "Keeping the pin rolling.",
    ways_to_mentor: ["1-to-1", "career coaching"],
    expertise_tech: ["A/V", "Videography"],
    expertise_non_tech: ["interviewing", "coaching"],
    mentee_capacity: 20,
    meeting_location: "Great Britain",
    stack_preference: "FE",
    identity_preference: ["no preference"]
  )

  puts "Seeding complete!"

end
