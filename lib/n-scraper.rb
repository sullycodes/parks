require 'open-uri'
require 'nokogiri'

class Scraper

BASE_URL = "https://www.mass.gov/guides/alphabetical-list-of-massachusetts-state-parks"

  def self.scrape_index
  		html = open(BASE_URL)
      doc = Nokogiri::HTML(html)

  		parks = []

      url = doc.css(".ma__stacked-row").css("p a @href")
      name = doc.css(".ma__stacked-row").css("a")
      # loc = doc.css(".ma__stacked-row p")


      puts url
      # loc.search('a') do |e| 
      #   e.remove
      # end

      doc.css(".ma__stacked-row").each do |e|
        puts e
        # hash = {}
        # # hash[:name] = e.css("a").text
        # # hash[:location] = e.css("p").text
        # # hash[:url] = e.css("p a @href").text
        # puts e
        # parks << hash
      end

  		# doc.css(".ma__stacked-row").each do |e|
    #   		hash = {}
    #   		hash[:name] = doc.css("a").text
    #   		# hash[:location] = e.css("p").text
    #   		hash[:url] = doc.css("p a @href").text
    #   		parks << hash
    # 	end

  		print parks

  end #scrape_index

  	def self.create_park

  		Park.new_from_index

  	end #scrape_park

end #Scraper

Scraper.scrape_index
