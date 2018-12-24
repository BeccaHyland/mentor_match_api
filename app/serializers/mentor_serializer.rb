class MentorSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id,
              :name,
              :email,
              :city,
              :state,
              :country,
              :slack_username,
              :matched,
              :active,
              :pronouns,
              :current_title,
              :current_employer,
              :background,
              :industries,
              :ways_to_mentor,
              :expertise_tech,
              :expertise_non_tech,
              :mentee_capacity,
              :meeting_location,
              :stack_preference,
              :identity_preference
end
