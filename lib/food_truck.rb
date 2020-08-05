require 'pry'

class FoodTruck

  attr_reader :name, :inventory
  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    @inventory[item]
  end

  def stock(item, stock)
    if @inventory[item]
      @inventory[item] += stock
    else
      @inventory[item] = stock
    end
  end

  def potential_revenue
    @inventory.keys.sum do |item|
     check_stock(item) * item.price
    end
  end

end
