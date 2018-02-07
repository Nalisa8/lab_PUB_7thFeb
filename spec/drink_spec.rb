require("minitest/autorun")
require_relative("../drink")
class DrinkTest < MiniTest::Test

  def setup
    @drink1 = Drink.new("Red Wine", 5, 2)
  end

  def test_drink_name
    name = @drink1.name
    assert_equal("Red Wine", name)
  end

  def test_drink_price
    price = @drink1.price
    assert_equal(5, price)
  end

  def test_drink_alcohol
    level = @drink1.alcohol_level
    assert_equal(2, level)
  end

end # end CLASS DRINKTEST
