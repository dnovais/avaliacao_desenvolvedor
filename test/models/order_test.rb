require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  def setup
    @order = orders(:one)
  end

  test "Test the association with Supplier" do
    refute @order.supplier.blank?, "Expected a Supplier associated records"
  end

  test "Test the association with Person" do
    refute @order.person.blank?, "Expected a Person associated records"
  end

  def file
<<eof
Comprador	descrição	Preço Uniário	Quantidade	Endereço	Fornecedor
João Silva	R$10 off R$20 of food	10.0	2	987 Fake St	Bob's Pizza
Amy Pond	R$30 of awesome for R$10	10.0	5	456 Unreal Rd	Tom's Awesome Shop
Marty McFly	R$20 Sneakers for R$5	5.0	1	123 Fake St	Sneaker Store Emporium
Snake Plissken	R$20 Sneakers for R$5	5.0	4	123 Fake St	Sneaker Store Emporium
eof
  end

  test "Test import_file method, when file is blank" do
    exception = assert_raises(RuntimeError) { Order.import_file("") }
  end

  test "Test import_file method" do
    Order.import_file(file)
    orders_count = Order.count
    assert_equal(orders_count, 6)
  end
end
