class User < ApplicationRecord
  validates_presence_of :name,
                        :role
  validates :login, uniqueness: true, presence: true

  # has_one :mentor
end
