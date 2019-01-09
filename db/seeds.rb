# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
StudentMentor.destroy_all
Mentor.destroy_all
Student.destroy_all
User.destroy_all

if Rails.env == 'development' || Rails.env == 'production'
  user_1 = User.create!(
    name: "Mary Berry User",
    role: "admin",
    login: "123",
    avatar_url: "pic@gh.com"
  )
  user_2 = User.create!(
    name: "Paul Hollywood User",
    role: "user",
    login: "456",
    avatar_url: "pic@gh.com"
  )
  user_3 = User.create!(
    name: "Susan Mel User",
    role: "user",
    login: "789",
    avatar_url: "pic@gh.com"
  )

  student_1 = Student.create!(
    name: "Jake Peralta",
    email: "jp@gmail.com",
    slack_username: "jp@slack.com",
    pronouns: "he/him",
    matched: true,
    active: true,
    industries: ["Law", "Retail", "Arts", "Teaching", "Marketing/Sales"],
    background: "Toit.",
    stack: "Back-End",
    identity_marker: ["Veteran", "Male-identifying"]
  )

  student_2 = Student.create!(
    name: "Amy Santiago",
    email: "as@gmail.com",
    slack_username: "as@slack.com",
    pronouns: "she/her",
    matched: true,
    active: true,
    industries: ["Law", "Medicine"],
    background: "The worst part is they forgot the comma.",
    stack: "Front-End",
    identity_marker: ["Parent", "Female-identifying"]
  )


  student_3 = Student.create!(
    name: "Raymond Holt",
    email: "rh@gmail.com",
    slack_username: "rh@slack.com",
    pronouns: "he/him",
    matched: true,
    active: true,
    industries: ["Law", "Teaching"],
    background: "Nutrition bricks. I have original no flavor, and whole wheat no flavor.",
    stack: "Front-End",
    identity_marker: ["LGBTQ+"]
  )

  mentor_1 = Mentor.create!(
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
    industries: ["AdTech", "Green Tech"],
    background: "I am one tough cookie.",
    ways_to_mentor: ["Mock Interviews", "Coffee Meetings"],
    expertise_tech: ["Data Science", "CSS/SCSS/Sass"],
    expertise_non_tech: ["Public Speaking", "Project Management", "Wellness & Stress Management", "Parenting", "Social Issues in the Tech Industry"],
    mentee_capacity: 10,
    meeting_location: ["Great Britain"],
    stack_preference: "Back-End",
    identity_preference: ["Veteran", "Female-identifying"],
    #user_id: user_1.id
  )

  mentor_2 = Mentor.create!(
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
    industries: ["Civic Tech", "FinTech"],
    background: "Saying what needs to be said.",
    ways_to_mentor: ["Resume & Cover Letters"],
    expertise_tech: ["Vue.js", "Functional Programming", "DevOps", "Ruby/Rails", "Go", "React.js", "Angular.js"],
    expertise_non_tech: ["Parenting", "Culture/Behavioral Interview Prep"],
    mentee_capacity: 5,
    meeting_location: ["Great Britain"],
    stack_preference: "Front-End",
    identity_preference: ["Parent"],
    # user_id: user_2.id
  )
  mentor_3 = Mentor.create!(
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
    industries: ["EdTech", "LegalTech"],
    background: "Keeping the pin rolling.",
    ways_to_mentor: ["Mock Interviews"],
    expertise_tech: ["GO", "Node.js", "Ember.js" "CSS/SCSS/Sass"],
    expertise_non_tech: ["Wellness & Stress Management"],
    mentee_capacity: 20,
    meeting_location: ["Great Britain"],
    stack_preference: "Front-End",
    identity_preference: [],
    # user_id: user_3.id
  )

  student_mentor_1 = StudentMentor.create!(student_id: student_1.id, mentor_id: mentor_2.id)
  student_mentor_2 = StudentMentor.create!(student_id: student_2.id, mentor_id: mentor_1.id)
  student_mentor_3 = StudentMentor.create!(student_id: student_3.id, mentor_id: mentor_3.id)

  puts "Seeding complete!"

end
