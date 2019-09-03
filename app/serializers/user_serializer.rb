class UserSerializer < ActiveModel::Serializer
  attributes :username, :email, :first_name, :last_name, :image, :id

  has_many :follow_requests

  # has_many :user_events
  # has_many :events, through: :user_events
  # has_many :messages
end
