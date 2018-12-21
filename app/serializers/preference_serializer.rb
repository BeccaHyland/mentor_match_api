class PreferenceSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title
  has_many :mentors
end
