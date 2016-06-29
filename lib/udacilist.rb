# lib/udacitask.rb

require 'formatador'
require_relative 'errors'

class UdaciList
  attr_reader :title, :items

  def initialize(options={})
    @title = (options[:title] != nil) ? options[:title] : "Untitled List"
    @items = []
  end

  # There must be a cleaner way to do this with Ruby... Y/N??
  def add(type, description, options={})

    # Check Priority Value
    priorities = ['low', 'medium', 'high']
    if options[:priority] != nil && !priorities.include?(options[:priority])
      raise UdaciListErrors::InvalidPriorityValue
    end

    # Check Type
    type = type.downcase
    if type == "todo"
      @items.push TodoItem.new(type, description, options)
    elsif type == "event"
      @items.push EventItem.new(type, description, options)
    elsif type == "link"
      @items.push LinkItem.new(type, description, options)
    else
      raise UdaciListErrors::InvalidItemType
    end
  end

  def delete(index)
    if index < @items.size && index >= 0
      @items.delete_at(index - 1)
    else
      raise UdaciListErrors::IndexExceedsListSize
    end
  end
  
  def all
    filter(nil, true)
  end

  def filter(type, all = false)
    puts "-" * @title.length
    print @title
    puts (type != nil)? " - " + type : ""
    puts "-" * @title.length

    data = @items.select{|i| i.type == type || all}
                  .map.with_index { |item, i| 
                      {
                        "" => i, 
                        "Description" => item.description, 
                        "Details" => item.details, 
                        "Type" => item.type
                      } 
                  }

    Formatador.display_table(data)

  end

end
