require_relative 'Item'

class TodoItem < Item
  include Listable
  attr_reader :description, :due, :priority

  def initialize(description, options={})
    super(type: "todo")
    @description = description
    @due = options[:due] ? Chronic.parse(options[:due]) : options[:due]
    # Check Priority Value
    set_priority options[:priority]
  end

  def details
    format_description(@description) + "due: " +
    format_date(@due, nil) +
    format_priority(@priority)
  end

  def set_priority(p)
    priorities = ['low', 'medium', 'high']
    if p != nil && !priorities.include?(p)
      raise UdaciListErrors::InvalidPriorityValue
    end
    @priority = p
  end
    

end
