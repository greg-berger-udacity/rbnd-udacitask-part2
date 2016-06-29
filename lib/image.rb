# new Item type

class ImageItem < Item

  def initialize(description, options={})
    super(type: "image")
  end

end
