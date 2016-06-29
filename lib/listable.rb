require 'colorize'

module Listable
  
  def format_description(description)
    "#{description}".ljust(30)
  end
  
  def format_priority(priority)
    value = " ⇧".colorize(:green) if priority == "high"
    value = " ⇨".colorize(:yellow) if priority == "medium"
    value = " ⇩".colorize(:red) if priority == "low"
    return (value != nil)? value : ""
  end

  def format_date(start_date, end_date)
    dates = (start_date)? start_date.strftime("%D") : ""
    dates += (start_date && end_date)? " -- " : ""
    dates += (end_date)? start_date.strftime("%D") : ""
    return dates
  end

end
