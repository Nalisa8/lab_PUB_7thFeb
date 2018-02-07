class Pub
attr_reader(:name, :till, :drinks)


  def initialize(name, till, drinks)
    @name = name
    @till = till
    @drinks = drinks
  end


  def sell_drink(customer, drink)
    if (customer.age >= 18) # Check age of customer
      if (customer.drunk_level < 16)
        price_of_drink = drink.price # Get price of drink
#       p "That drink costs #{price_of_drink}"
        customer.pay_for_drink(price_of_drink) # Take money from wallet
        @till += price_of_drink # Add money to till
#       p "Thank you for paying, enjoy!"
        customer.drink_drink(drink)
      else
        return "Taxi on its way dude!"
      end
    else
      return "Woo there Kiddo, where are your folks?"
    end # end if
  end # end DEF SELL_DRINK


  def sell_food(customer, food)
    price_of_food = food.price
    customer.pay_for_food(price_of_food)
    @till += price_of_food
    customer.eat_food(food) 
  end # end DEF SELL_FOOD

end # end CLASS PUB
