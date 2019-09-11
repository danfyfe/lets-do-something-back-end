class Event < ApplicationRecord
  has_secure_password
  has_many :user_events
  has_many :users, through: :user_events
  has_many :invites

  has_one :budget

  has_many :costs, through: :budget

  validates :title, presence: true, uniqueness: true
end
