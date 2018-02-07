require("minitest/autorun")
require_relative("../customer")
require_relative("../drink")
require_relative("../food")

class CustomerTest < MiniTest::Test

  def setup
    @customer1 = Customer.new("Paul", 100, 34)
    @customer2 = Customer.new("Nat", 30, 31)
    @drink1 = Drink.new("Red Wine", 5, 2)
    @food1 = Food.new("burger", 5)
  end

  def test_customer_name
    name = @customer1.name()
    assert_equal("Paul", name) # test 1
  end

  def test_customer_wallet
    wallet = @customer2.wallet()
    assert_equal(30, wallet) # test 2
  end

  def test_customer_pay_for_drink
    @customer1.pay_for_drink(15)
    new_wallet_total = @customer1.wallet
    assert_equal(85, new_wallet_total) # test 3
  end

  def test_customer_age
    age = @customer2.age()
    assert_equal(31, age) # test 4
  end

  def test_customer_drink_drink
    @customer2.drink_drink(@drink1)
    drunk_level = @customer2.drunk_level
    assert_equal(2, drunk_level) # test 5
  end

  def test_customer_pay_for_food
    price = @food1.price
    @customer1.pay_for_food(price)
    new_wallet_total = @customer1.wallet
    assert_equal(95, new_wallet_total) # test 6

  end
 def test_customer_eat_food
   @customer1.drink_drink(@drink1)
   drunk_level_before = @customer1.drunk_level
   @customer1.eat_food(@food1)
   drunk_level_after = @customer1.drunk_level
   assert_equal(2, drunk_level_before)
   assert_equal(0, drunk_level_after)
   end



end # end CLASS
