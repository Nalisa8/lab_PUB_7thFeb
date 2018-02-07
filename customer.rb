class Customer
attr_reader(:name, :wallet, :age, :drunk_level)

  def initialize(name, wallet, age)
    @name = name
    @wallet = wallet
    @age = age
    @drunk_level = 0
  end

  def pay_for_drink(price_of_drink)
    @wallet -= price_of_drink
  end

  def drink_drink(berverage)
    @drunk_level += berverage.alcohol_level
  end

  def pay_for_food(price_of_food)
    @wallet -= price_of_food
  end

  def eat_food(food)
    @drunk_level -= food.rej_level
    if (@drunk_level < 0)
      @drunk_level = 0
    end
  end
end # end CLASS CUSTOMER
