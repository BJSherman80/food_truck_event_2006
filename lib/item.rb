
require 'pry'

class Item

  attr_reader :name, :price

  def initialize(attributes)
    @name = attributes[:name]
    @price = attributes[:price].to_s.tr('$', '').to_f
  end

  

end
