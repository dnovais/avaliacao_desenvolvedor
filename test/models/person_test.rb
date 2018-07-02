require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  def setup
    @person = people(:one)
  end

  test " Test the association has_many orders " do
    assert_equal 2, @person.orders.size
  end
end
