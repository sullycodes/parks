# require '../config/environment.rb'
require_relative './scraper.rb'
require_relative './parks.rb'
require 'pry'


class CLI 

  def run
    make_parks
    puts "Welcome to Massachusetts State Parks!"
    puts ""
    puts "Please enter the park number from the list below to learn more about it:"
    puts ""
    list_parks
    choose_park
    # display_park
    # puts "Would you like to see the list of parks again? (y/n)"
  end

  def make_parks
  	park_array = Scraper.scrape_index #returns array of arrays[["Alewife", "site.htm"], ["Park B", "url"]]
  	park_array.each do |e|
  		name = e[0]
  		url = e[1]
  		Park.new(name, url)
      end
  end

  def list_parks
  	Park.all.flatten.each_with_index do |e,i|
  		puts "#{i+1}. #{e.name}"
  	end
  end


  def choose_park
  	names = []
	
	Park.all.each do |e|
	  names << e.name
	end
  	
  	puts "What number would you like to see?"
	input = gets.chomp
	input = input.to_i
	
	names.each_with_index do |e,i|
	  if i == input - 1
	  	puts e #replace with a fin by name from an old lesson and then pass the park into display park
		# park = Park.all.find_by_name(e)
		# display_park(park)
	  	# 
	  end 
	end
  
  end

  # def display_park(park)
  # 	puts "#{park.name}"
  # 	puts ""
  # 	puts "Address: #{park.address}"
  # 	puts ""
  # 	puts "Overview: #{park.overview}"
  # 	puts ""
  # 	puts "Phone: #{park.phone}"
  # 	puts ""
  # 	puts "Email: #{park.email}"
  # 	puts ""
  # 	puts "Activities: #{park.activities}"
  # 	puts ""
  # 	puts "Hours: #{park.hours}"
  # 	puts ""
  # end

end #CLI