require 'test_helper'

class SupplierTest < ActiveSupport::TestCase
  def setup
    @supplier = suppliers(:one)
  end

  test " Test the association has_many orders " do
    assert_equal 0, @supplier.orders.size
  end
end
