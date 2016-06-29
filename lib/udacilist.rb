# lib/udacitask.rb

require 'formatador'
require_relative 'errors'

class UdaciList
  attr_reader :title, :items

  def initialize(options={})
    @title = (options[:title] != nil) ? options[:title] : "Untitled List"
    @items = []
    default_types = {
      "todo" => "TodoItem",
      "event" => "EventItem",
      "link" => "LinkItem"
    }
    @types = Hash.new
    default_types.each { |key, value| register_new_type(key, value) }
  end

  def add(type, description, options={})

    # Check Type
    type = type.downcase
    
    if @types.has_key?(type)
      @items.push Object.const_get(@types[type]).new(description, options)
      return @items.last
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

  def register_new_type(file_name, class_name)
    require "./lib/" + file_name
    if !@types.has_key?(file_name) && class_exists?(class_name)
      @types[file_name] = class_name
    else
      raise UdaciListErrors::InvalidClassType
    end  
  end

  def class_exists?(class_name)

    klass = Object.const_get(class_name)
    return klass.is_a?(Class)
    rescue NameError
      return false
  end

end
