class FollowRequestSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :follower_id, :accepted


end
