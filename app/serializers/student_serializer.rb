class StudentSerializer
  include FastJsonapi::ObjectSerializer
    attributes :id,
                :name,
                :pronouns,
                :email,
                :matched,
                :active,
                :stack,
                :slack_username,
                :background,
                :industries,
                :identity_marker
end
