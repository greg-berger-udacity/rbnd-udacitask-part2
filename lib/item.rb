# parent class for items

class Item
  attr_accessor :type

  def initialize(options={})
    @type = options[:type]
  end
end
