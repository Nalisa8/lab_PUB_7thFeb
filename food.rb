class Food
attr_reader(:type, :price, :rej_level)

  def initialize(type, price)
    @type = type
    @price = price
    @rej_level = case type
    when "peanuts" then 2
    when "burger" then 5
      else 0
    end # end CASE

  end # end DEF init


end # end CLASS FOOD
