class MentorSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :email, :city, :state, :slack_username, :linkedin_username, :github_username, :program, :active, :matched

  attribute :preferences do |mentor|
    mentor.preferences.map do |preference|
      {id: "#{preference.id}", title: "#{preference.title}"}
    end
  end

end
