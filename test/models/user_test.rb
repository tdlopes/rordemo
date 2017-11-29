require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'should not save user without name or email' do
    user = User.new
    assert_raises(ActiveRecord::NotNullViolation) {
      user.save
    }

    user.name = 'a'
    assert_raises(ActiveRecord::NotNullViolation) {
      user.save
    }
  end

  test 'should not save user without email' do
    user = User.new
    user.name = 'Dummy'
    assert_raises(ActiveRecord::NotNullViolation) {
      user.save
    }
  end

  test 'should save user' do
    user = User.new
    user.name = 'Dummy'
    user.email = 'a@a.a'
    assert user.save
  end
end
