require 'nokogiri'
require 'open-uri'
require_relative './scraper.rb'
require_relative './cli.rb'


class Park 

	attr_accessor :name, :url, :address, :phone, :overview, :actvities, :hours


	@@all = []

	# doc = Nokogiri::HTML(open(self.url.prepend("")))

	def initialize(name = nil, url = nil)
		@name = name
		@url = url
		@@all << self
	end

	def self.all
		@@all
	end

	def add_park_attributes

	    Park.all.each do |e|
	      park_url = "https://www.mass.gov" + e.url

	      doc = Nokogiri::HTML(open(park_url))

	      e.address = doc.css('.ma__contact-group__address').text
	      e.phone = doc.css('section.ma__contact-us > div > div > div:nth-child(2) > div > a').text.gsub(/\s/, "")
	      e.overview = doc.css('.ma__page-overview .ma__rich-text').text.strip
	      # e.hours = doc.css('div.page-content > div > div:nth-child(3) > div > p:nth-child(1)').text
	    end
	end

	# def doc
	# 	@doc
	# end

end #Park