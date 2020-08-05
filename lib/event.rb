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



end