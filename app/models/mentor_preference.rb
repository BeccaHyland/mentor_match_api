class MentorPreference < ApplicationRecord
  belongs_to :preference
  belongs_to :mentor
end