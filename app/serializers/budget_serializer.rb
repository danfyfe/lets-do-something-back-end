class BudgetSerializer < ActiveModel::Serializer
  attributes :id, :event
  has_many :costs
end
