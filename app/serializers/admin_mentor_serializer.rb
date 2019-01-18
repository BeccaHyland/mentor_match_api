class AdminMentorSerializer
  include FastJsonapi::ObjectSerializer
  set_type :mentor
  # belongs_to :user
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
              :meeting_location,
              :stack_preference,
              :mentee_capacity,
              :identity_preference

    attribute :avatar_url do |object|
      object.user.avatar_url
    end
end
