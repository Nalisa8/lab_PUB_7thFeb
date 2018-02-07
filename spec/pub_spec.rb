require("minitest/autorun")
require_relative("../pub")
require_relative("../drink")
require_relative("../customer")
require_relative("../food")

class PubTest < MiniTest::Test

  def setup
    @drink1 = Drink.new("Red Wine", 5, 2)
    @drink2 = Drink.new("White Wine", 5, 2)
    @drink3 = Drink.new("Joke IPA", 3, 1)
    @drink4 = Drink.new("Leffe Beer", 4, 2)
    @drink5 = Drink.new("Gray Goose Vodka", 6, 4)
    drinks = [@drink1, @drink2, @drink3, @drink4, @drink5]
    @ThePub = Pub.new("The Coding Arms", 10, drinks)
    @customer1 = Customer.new("Paul", 100, 34)
    @customer2 = Customer.new("Nat", 30, 31)
    @customer3 = Customer.new("Baby Face", 5, 8)
    @food1 = Food.new("burger", 5)
    @food2 = Food.new("peanuts", 1)
  end

  def test_pub_name
    name = @ThePub.name
    assert_equal("The Coding Arms", name) # test 1
  end

  def test_pub_till
    amount = @ThePub.till
    assert_equal(10,amount) # test 2
  end

  def test_pub_drinks
    drink_stock = @ThePub.drinks.length
    assert_equal(5, drink_stock) # test 3
  end

  def test_buy_drink
    @ThePub.sell_drink(@customer1,@drink4)
    new_till_total = @ThePub.till
    new_wallet_total = @customer1.wallet
    assert_equal(96, new_wallet_total) # test 4
    assert_equal(14, new_till_total) # test 5
  end

  def test_buy_drink__age_fail
    reply = @ThePub.sell_drink(@customer3,@drink5)
    assert_equal("Woo there Kiddo, where are your folks?", reply) # test 6
  end

  def test_customer_gets_drunk_when_buying_drinks
    @ThePub.sell_drink(@customer2,@drink1)
    drunk_level = @customer2.drunk_level
    assert_equal(2, drunk_level) # test 7
  end

  def test_customer_too_drunk_to_buy
    @ThePub.sell_drink(@customer2,@drink5)
    @ThePub.sell_drink(@customer2,@drink5)
    @ThePub.sell_drink(@customer2,@drink5)
    @ThePub.sell_drink(@customer2,@drink5)
    reply = @ThePub.sell_drink(@customer2,@drink5)
    assert_equal("Taxi on its way dude!", reply) # test 8
  end

  def test_customer_buy_food
    @ThePub.sell_food(@customer2,@food1)
    new_wallet_total = @customer2.wallet
    assert_equal(25, new_wallet_total) # test 9
    new_till_total = @ThePub.till
    assert_equal(15, new_till_total) # test 10
  end

  def test_customer_buy_food__check_drunk
    @ThePub.sell_drink(@customer2,@drink5)
    @ThePub.sell_drink(@customer2,@drink5)
    @ThePub.sell_drink(@customer2,@drink5)
    @ThePub.sell_food(@customer2,@food1)
    new_drunk_level = (@customer2.drunk_level)
    assert_equal(7, new_drunk_level)
  end
  
end # end CLASS PUBTEST
