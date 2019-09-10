class EventSerializer < ActiveModel::Serializer
  attributes :id, :owner_id, :title, :start, :end, :description

  has_many :users
  has_many :invites

end
