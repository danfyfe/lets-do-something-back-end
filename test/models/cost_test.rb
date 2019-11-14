require 'test_helper'
require 'faker'

class CostTest < ActiveSupport::TestCase

  test "can create a cost" do
    user = User.create(username: Faker::Name.name, password:'123')

    event = Event.create(title: Faker::Hipster.word, owner_id: user.id, password:'123')

    budget = Budget.create(event_id: event.id)

    cost = Cost.new(budget_id: budget.id, user_id: user.id, price: 100.00, name: Faker::Hipster.word, description: Faker::Hipster.sentence)

    assert cost.save, 'Saves cost'

  end


end
