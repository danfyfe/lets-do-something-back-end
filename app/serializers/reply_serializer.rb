class ReplySerializer < ActiveModel::Serializer
  attributes :id, :user, :content, :created_at, :message_id

  belongs_to :message
  belongs_to :user

end
