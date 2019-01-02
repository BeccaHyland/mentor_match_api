class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :avatar_url
  has_one :mentor
end
