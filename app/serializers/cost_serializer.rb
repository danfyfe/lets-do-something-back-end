class CostSerializer < ActiveModel::Serializer
  attributes :id, :user, :event, :name, :description, :price, :budget_id
end
