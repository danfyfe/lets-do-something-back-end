class EventSerializer < ActiveModel::Serializer
  attributes :id, :owner_id, :title, :start, :end, :description, :budget

  has_many :users
  has_many :invites

  has_many :costs, through: :budget

end
