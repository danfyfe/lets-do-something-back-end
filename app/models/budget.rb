class Budget < ApplicationRecord
  belongs_to :event
  has_many :costs
end
