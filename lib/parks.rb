require 'nokogiri'
require 'open-uri'
require_relative './scraper.rb'
require_relative './cli.rb'


class Park 

	attr_accessor :name, :url, :address, :phone, :overview, :activities, :location

	@@all = []

	def initialize(name = nil, url = nil, location = nil)
		@name = name
		@url = url
		@location = location
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