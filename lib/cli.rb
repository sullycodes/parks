# require '../config/environment.rb'
require_relative './scraper.rb'
require_relative './parks.rb'
require 'pry'


class CLI 

  def run
    make_parks
    greeting
    list_parks
    # choose_park
    # puts "Would you like to see the list of parks again? (y/n)"
  end

  def greeting
  	system "clear" or system "cls"
    2.times do puts "" end
	puts "Welcome to Massachusetts State Parks! Home to over 150 beautiful, scenic, and impeccably maintained parks."
    puts ""
    # puts "HIT ANY BUTTON to see the first 30 of our amazing parks!"
    # puts ""
    # gets.chomp
  end

  def make_parks
  	park_array = Scraper.scrape_index #returns array of arrays[["Alewife", "site.htm"], ["Park B", "url"]]
  	park_array.each do |e|
  		name = e[0]
  		url = e[1]
  		location = e[2]
  		Park.new(name, url, location)
      end
  end

  def list_parks
	Park.all[0..29].flatten.each_with_index do |e,i|  		
  		puts "#{i+1}. #{e.name} #{e.location}"
  	end
	
	choose_text = "Enter the number of the park you like to see or HIT \"m\" for more Massachusetts State Parks."
	puts ""
	puts choose_text
	
	input = gets.chomp
	integer = input.to_i
	if input == "m" || input == "M"
		system "clear" or system "cls"
    	2.times do puts "" end
		Park.all[30..59].flatten.each_with_index do |e,i|  		
  			puts "#{i+31}. #{e.name}"
  		end
  	elsif
  		integer.between?(1,30)
  		choose_park(integer)
  	end
  		puts ""
		puts choose_text

  	input = gets.chomp
	integer = input.to_i
	#61-90
	if input == "m" || input == "M"
		system "clear" or system "cls"
    	2.times do puts "" end
		Park.all[60..89].flatten.each_with_index do |e,i|  		
  			puts "#{i+61}. #{e.name}"
  		end
  	elsif
  		integer.between?(31,60)
  		choose_park(integer)
  	end
  		puts ""
		puts choose_text

	input = gets.chomp
	integer = input.to_i
	#91-120
	if input == "m" || input == "M"
		system "clear" or system "cls"
    	2.times do puts "" end
		Park.all[90..119].flatten.each_with_index do |e,i|  		
  			puts "#{i+91}. #{e.name}"
  		end
  	elsif
  		integer.between?(91,120)
  		choose_park(integer)
  	end
  		puts ""
		puts choose_text

	input = gets.chomp
	integer = input.to_i
	#121-156
	if input == "m" || input == "M"
		system "clear" or system "cls"
    	2.times do puts "" end
		Park.all[120..155].flatten.each_with_index do |e,i|  		
  			puts "#{i+121}. #{e.name}"
  		end
  	elsif
  		integer.between?(121,156)
  		choose_park(integer)
  	end
  		puts ""
		puts choose_text

		input = gets.chomp
		integer = input.to_i


  end #list_parks



  def choose_park(input)
  	
 	names = []
	
	Park.all.each do |e|
	  names << e.name
	end
  	
	Park.all.each_with_index do |e,i|
	  if i == input - 1
	  	display_park(e)
	  end 
	end
  
  end

  def display_park(park)
  	park_url = park.url
  	park.add_park_attributes(park_url)
  	puts ""
  	puts ""  	
  	puts "#{park.name}"
  	puts ""
  	puts "Overview: #{park.overview}"
  	puts ""  	
  	puts "Activities: #{park.activities.join(", ")}"
  	puts ""  	
  	puts "Address: #{park.address}"
  	puts ""
  	puts "Phone: #{park.phone}"
  	puts ""
  	puts "Website: " + "https://www.mass.gov" + "#{park.url}"
  end

end #CLI

