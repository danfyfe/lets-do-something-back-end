class UserSerializer < ActiveModel::Serializer
  attributes :username, :email, :first_name, :last_name, :image, :dob

  has_many :user_events
  has_many :events, through: :user_events
end
