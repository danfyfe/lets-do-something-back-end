class UserSerializer < ActiveModel::Serializer
  attributes :username, :email, :first_name, :last_name, :image, :id

  has_many :follow_requests

  # has_many :followed_users, foreign_key: :follower_id, class_name: 'Follow'

  has_many :followees, through: :followed_users

  # has_many :following_users, foreign_key: :followee_id, class_name: 'Follow'

  has_many :followers, through: :following_users


  # has_many :user_events
  # has_many :events, through: :user_events
  # has_many :messages
end
