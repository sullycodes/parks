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

	# def doc
	# 	@doc
	# end


	# park_container = .ma__details__content #might not need

	# address = .ma__contact-group__address
	# phone = .ma__content-link ma__content-link--phone
	# description = div.overview .ma__page-overview > div:nth-child(2) #called overview on page

end #Park