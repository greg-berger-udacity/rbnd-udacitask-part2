require_relative 'Item'

class LinkItem < Item
  include Listable
  attr_reader :description, :site_name

  def initialize(url, options={})
    super(type: "link")
    @description = url
    @site_name = options[:site_name]
  end
  
  def format_name
    @site_name ? @site_name : ""
  end

  def details
    format_description(@description) + "site name: " + format_name
  end
end
