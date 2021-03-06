require './lib/item'
require './lib/food_truck'
require 'pry'

class Event
  attr_reader :name, :food_trucks
  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(food_truck)
    @food_trucks << food_truck
  end

  def food_truck_names
    names = @food_trucks.find_all {|food_trucks, inventorys| food_trucks.name }
    names.map do |food_truck, inventory|
      food_truck.name
    end
  end

    def food_trucks_that_sell(item)
      @food_trucks.find_all do |food_truck|
      food_truck.inventory.include?(item)
    end
  end

  def total_inventory
    hash = Hash.new {|h,k| h[k] = {quantity: 0, food_trucks: [] }}
      @food_trucks.each do |food_truck|
        food_truck.inventory.each do |item, ammount|
            hash[item][:quantity]+= ammount
            hash[item][:food_trucks] << food_truck
          end
        end
      hash
  end

  def overstocked_items
    total_inventory.keys.find_all do |item|
      total_inventory[item][:quantity] > 50 && total_inventory[item][:food_trucks].count > 1
    end
  end

  def sorted_item_list
    items = total_inventory.keys.map{ |item| item.name}
    items.sort
  end

end
