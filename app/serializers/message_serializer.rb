class MessageSerializer < ActiveModel::Serializer
  attributes :id, :content, :title, :event, :user, :created_at, :replies

  has_many :replies

end
