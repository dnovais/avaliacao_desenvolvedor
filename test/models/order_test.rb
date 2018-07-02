require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  def setup
    @order = orders(:one)
  end

  test " Test the association with Supplier " do
    @order.supplier_id = nil
    refute @order.valid?, "Expected a Supplier associated records"
  end

  test " Test the association with Person " do
    @order.person_id = nil
    refute @order.valid?, "Expected a Person associated records"
  end
end
