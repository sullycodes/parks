# scrape Mass Parks site for a list of parks with attributes (get a page, target each park and get attributes )
# take the names and urls of each park and display a list using a method called #list_parks
# Have the user choose one based on a number
# When the user chooses one it will display info about that park using a method called display_park


require 'open-uri'
require 'nokogiri'
require_relative './parks.rb'
require_relative './cli.rb'

class Scraper

  BASE_URL = "https://www.mass.gov"

  def self.scrape_index
      
      doc = Nokogiri::HTML(open(BASE_URL + "/guides/alphabetical-list-of-massachusetts-state-parks"))
      park = doc.css("div.main-content.main-content--full .ma__rich-text a")

      parks = []

      park.each do |e|
        array = []
        array << e.text
        array << e.css("@href").text
        parks << array
      end

      parks.pop
      parks.pop
      parks

  end

  # def add_location(array)
  #     doc = Nokogiri::HTML(open(BASE_URL + "/guides/alphabetical-list-of-massachusetts-state-parks"))
  #     rough_loc = doc.css(".page-content p")
  #     rough_loc.search("a").remove
  #     location = rough_loc.css("p").text.strip
  #     array << location
  # end


  def self.scrape_park_page(park_url)

    doc = Nokogiri::HTML(open(BASE_URL + park_url))

    hash = {}
    hash[:overview] = doc.css('.ma__page-overview .ma__rich-text').text.strip      
    hash[:activities] = doc.css('.ma__details__content > .ma__rich-text h3#all-activities + ul li').collect do |e|
      e.to_s.gsub("<li>", " ").gsub("</li>", " ").strip
    end
    hash[:address] = doc.css('.ma__contact-group__address').text.strip
    hash[:phone] = doc.css('.ma__content-link--phone').text.gsub(/\s/, "")
    # hash[:hours] = doc.css('div.page-content > div > div:nth-child(3) > div > p:nth-child(1)').collect do |e|
    #   e.to_s.gsub("<li>", " ").gsub("</li>", " ").strip
    # end

    hash
  
  end

end #Scraper