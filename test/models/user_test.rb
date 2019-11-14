require 'test_helper.rb'

class UserTest < ActiveSupport::TestCase

  test "should not save User without username" do
    user = User.new
    assert_not user.save, "Saved the User without a username"
  end

  

end
