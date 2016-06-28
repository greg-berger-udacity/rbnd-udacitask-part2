require_relative 'Item'

class TodoItem < Item
  include Listable
  attr_reader :description, :due, :priority

  def initialize(type, description, options={})
    super(type: type)
    @description = description
    @due = options[:due] ? Chronic.parse(options[:due]) : options[:due]
    @priority = options[:priority]
  end

  def details
    format_description(@description) + "due: " +
    format_date(@due, nil) +
    format_priority(@priority)
  end
end
