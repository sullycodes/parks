# scrape Mass Parks site for a list of parks with attributes (get a page, target each park and get attributes )
# take the names and urls of each park and display a list using a method called #list_parks
# Have the user choose one based on a number
# When the user chooses one it will display info about that park using a method called display_park


require 'open-uri'
require 'nokogiri'
require 'pry'
require_relative './parks.rb'
require_relative './cli.rb'

class Scraper

BASE_URL = "https://www.mass.gov/guides/alphabetical-list-of-massachusetts-state-parks"

  def self.scrape_index
      
      doc = Nokogiri::HTML(open(BASE_URL))
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


  def self.scrape_park_page

  end

end #Scraper

  # c = Scraper.scrape_index
  # print c[0..1]