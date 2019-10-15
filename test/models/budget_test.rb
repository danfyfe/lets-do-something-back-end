require 'test_helper'
require 'faker'

class BudgetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "does not creates a budget without an event" do
    budget = Budget.new()
    assert_not budget.save, 'Budget saved without event'
  end

  test "can create a budget" do
    user = User.create(username: Faker::Name.name, password:'123')

    event = Event.create(title: Faker::Hipster.word, owner_id: user.id, password:'123')

    budget = Budget.new(event_id: event.id)

    assert budget.save, 'Saves budget'
  end

end
