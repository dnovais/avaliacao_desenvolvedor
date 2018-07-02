require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  def setup
    @order = orders(:one)
  end

  test "Test the association with Supplier" do
    @order.supplier_id = nil
    refute @order.valid?, "Expected a Supplier associated records"
  end

  test "Test the association with Person" do
    @order.person_id = nil
    refute @order.valid?, "Expected a Person associated records"
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
end
