class MentorSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :email, :city, :state, :slack_username, :linkedin_username, :github_username, :program, :active, :matched
end
