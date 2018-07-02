require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  def setup
    @person = people(:one)
  end

  test "should not save a person without name" do
    person = Person.new
    assert_not person.save, "Saved the person without a name"
  end
end
