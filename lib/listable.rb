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

  def format_date(d0, d1)
    dates = (d0)? d0.strftime("%D") : ""
    dates += (d0 && d1)? " -- " : ""
    dates += (d1)? d0.strftime("%D") : ""
    return dates
  end

end
