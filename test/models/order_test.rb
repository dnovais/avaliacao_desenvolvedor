require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  def setup
    @order = orders(:one)
  end

  test " Test the association with Supplier " do
    refute @order.supplier.blank?, "Expected a Supplier associated records"
  end

  test " Test the association with Person " do
    refute @order.person.blank?, "Expected a Person associated records"
  end
end
