# require '../config/environment.rb'
require_relative './scraper.rb'
require_relative './parks.rb'
require 'pry'


class CLI 

  def run
    make_parks
    greeting
    list_parks
    choose_park
    # puts "Would you like to see the list of parks again? (y/n)"
  end

  def greeting
  	system "clear" or system "cls"
    3.times do puts "" end
	puts "Welcome to Massachusetts State Parks!"
    puts ""
    puts "Massachusetts is home to over 150 beautiful, scenic and impeccably maintained parks. HIT ANY BUTTON to see the first 30 of our amazing parks!"
    puts ""
    gets.chomp
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
	Park.all[0..29].flatten.each_with_index do |e,i|  		
  		puts "#{i+1}. #{e.name}"
  	end
	
	puts "Enter the number of the park you like to see or HIT \"m\" for more Massachusetts State Parks."
	
	input = gets.chomp
	
	if input == "m" || "M"
		Park.all[30..59].flatten.each_with_index do |e,i|  		
  			puts "#{i+1}. #{e.name}"
  		end
  	else
  		if input == 1..30 
  			choose_park #(input)
  		end
  	end

  end #list_parks



  def choose_park
  	names = []
	
	Park.all.each do |e|
	  names << e.name
	end
  	
  	puts "What number would you like to see?"
	input = gets.chomp
	input = input.to_i
	
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

