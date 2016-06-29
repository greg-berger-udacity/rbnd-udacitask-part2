# parent class for items

class Item
  attr_accessor :type, :description

  def initialize(options={})
    @type = options[:type]
    @description = "Generic Item, override @description in your Item class"
  end

  def details
    ""
  end

end
