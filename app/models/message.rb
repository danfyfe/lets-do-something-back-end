class Message < ApplicationRecord
  belongs_to :event
  belongs_to :user

  has_many :replies
end
