class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :image, :email
  has_many :user_events
  has_many :events, through: :user_events
end
