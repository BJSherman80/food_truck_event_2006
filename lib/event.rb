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





end
