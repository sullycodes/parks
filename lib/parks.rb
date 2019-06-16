require_relative '../config/environment'

class Park 

	attr_accessor :name, :url, :address, :phone, :overview, :activities

	@@all = []

	def initialize(name = nil, url = nil)
		@name = name
		@url = url
		@@all << self
	end


	def self.all
		@@all
	end


	def add_park_attributes(park_url)
		hash = Scraper.scrape_park_page(park_url)
		@overview = hash[:overview]
		@activities = hash[:activities]
		@address = hash[:address]
		@phone = hash[:phone]
	end

end #Park