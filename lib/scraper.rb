require 'open-uri'
require 'nokogiri'

class Scraper

BASE_URL = "https://www.mass.gov/guides/alphabetical-list-of-massachusetts-state-parks"

  def self.scrape_index
  		html = open(BASE_URL)
      doc = Nokogiri::HTML(html)

  		parks = []

      url = doc.css(".ma__stacked-row").css("p a @href").last.text
      park = doc.css(".ma__stacked-row").css("a").text
      # loc = doc.css(".ma__stacked-row p").first.text

      # locations = loc.search('a').each do |e| 
      #   e.remove
      # end

      puts park, url

#       doc.search('img').each do |src|
#   src.remove
# end

      # park3 = doc.css(".ma__stacked-row section").css("p").first.text


  		# doc.css(".ma_rich-text").each do |e|
    #   		hash = {}
    #   		# name = e.css("p a @href").text
    #   		# location = e.css("p").text
    #   		# url = e.css("a @href").text
    #   		hash[:name] = e.css("p a @href").text
    #   		hash[:location] = e.css("p").text
    #   		hash[:url] = e.css("a @href").text
    #   		parks << hash
    # 	end
  		# parks
  end #scrape_index

  	def self.create_park

  		Park.new_from_index

  	end #scrape_park

end #Scraper

Scraper.scrape_index