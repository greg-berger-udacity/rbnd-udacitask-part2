module Listable
  
  def format_description(description)
    "#{description}".ljust(30)
  end
  
  def format_priority(priority)
    value = " ⇧" if priority == "high"
    value = " ⇨" if priority == "medium"
    value = " ⇩" if priority == "low"
    value = "" if !priority
    return value
  end

  def format_date(d0, d1)
    dates = (d0)? d0.strftime("%D") : ""
    dates += (d0 && d1)? " -- " : ""
    dates += (d1)? d0.strftime("%D") : ""
    return dates
  end

end
