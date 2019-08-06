class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :first_name, :last_name, :image_url, :dob
  has_many :user_events
  has_many :events, through: :user_events
end
