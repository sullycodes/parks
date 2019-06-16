require_relative '../config/environment'

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

  def self.scrape_park_page(park_url)

    doc = Nokogiri::HTML(open(BASE_URL + park_url))

    hash = {}
    hash[:overview] = doc.css('.ma__page-overview .ma__rich-text').text.strip      
    hash[:activities] = doc.css('.ma__details__content > .ma__rich-text h3#all-activities + ul li').collect do |e|
      e.to_s.gsub("<li>", " ").gsub("</li>", " ").strip
    end
    hash[:address] = doc.css('.ma__contact-group__address').text.strip
    hash[:phone] = doc.css('.ma__content-link--phone').text.gsub(/\s/, "")
    hash
  
  end

end #Scraper