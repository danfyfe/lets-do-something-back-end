class Cost < ApplicationRecord
  belongs_to :budget
  belongs_to :user
  has_one :event, through: :budget
end
