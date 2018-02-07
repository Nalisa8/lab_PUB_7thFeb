require("minitest/autorun")
require_relative("../food")

class FoodTest < MiniTest::Test

  def setup
    @food1 = Food.new("burger", 5)
  end

  def test_food_rej_level
    rej_level = @food1.rej_level
    assert_equal(5, rej_level)
  end

  def test_food_price
    price = @food1.price
    assert_equal(5, price)
  end

end # end CLASS FOODTEST
