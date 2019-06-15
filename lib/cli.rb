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
  	clear_screen
	puts "Welcome to Massachusetts State Parks! Home to over 150 beautiful, scenic, and impeccably maintained parks."
    puts ""
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

  def clear_screen
	system "clear" or system "cls"
    2.times do puts "" end
  end

  def leave_or_again?
  	puts ""
  	puts "Invalid entry."
  	puts ""
  	puts "To return to the beginning of the list ENTER \"r\" or ENTER anything else to exit."
  	input = gets.chomp
  	if input == "r" || input == "R"
  		clear_screen
  		greeting
  		list_parks
  	else
  		clear_screen
  		puts "Thanks for visiting Massachusetts State Parks!"
  	end
  end


  def list_parks
	choose_text = "Enter the number of the park you like to see or ENTER \"m\" for more Massachusetts State Parks."

	Park.all[0..29].flatten.each_with_index do |e,i|  		
  		puts "#{i+1}. #{e.name} #{e.location}"
  	end
	
	puts ""
	puts choose_text
	input = gets.chomp
	integer = input.to_i

	if integer.between?(1,30) #display a chosen park from the list - if/elsif 1
  		choose_park(integer)
	elsif input == "m" || input == "M" #show 31-60
		clear_screen
		Park.all[30..59].flatten.each_with_index do |e,i|  		
  			puts "#{i+31}. #{e.name}"
  		end
  		puts ""
		puts choose_text
		input = gets.chomp
		integer = input.to_i
			if integer.between?(31,60) # if/elsif 2
  				choose_park(integer)
			elsif input == "m" || input == "M" #show 61-90
				clear_screen
				Park.all[60..89].flatten.each_with_index do |e,i|  		
	  				puts "#{i+61}. #{e.name}"
	  			end
		  		puts ""
				puts choose_text
				input = gets.chomp
				integer = input.to_i
					if integer.between?(61,90) #display a chosen park from the list - if/elsif 3	
		  				choose_park(integer)
					elsif input == "m" || input == "M" #show 91-120
						clear_screen
						Park.all[90..119].flatten.each_with_index do |e,i|  		
			  				puts "#{i+91}. #{e.name}"
			  			end
				  		puts ""
						puts choose_text
						input = gets.chomp
						integer = input.to_i
							if integer.between?(91,120) #display a chosen park from the list - if/elsif 4	
				  				choose_park(integer)
							elsif input == "m" || input == "M" #show 121-156
								clear_screen
								Park.all[120..155].flatten.each_with_index do |e,i|  		
					  				puts "#{i+121}. #{e.name}"
					  			end
						  		puts ""
								puts "This is the end of the list. Enter the number of the park you wish to see."
								input = gets.chomp
								integer = input.to_i
									if integer.between?(121,156) #display a chosen park from the list - if/elsif 4	
				  						choose_park(integer)
				  					end # last 30+ parks	
							end #if/elsif 4		
					end #if/elsif 3	
			end #if/elsif 2
  	# end #if/elsif 1
  	else
  		leave_or_again?
  	end



		# puts leave_or_again_text

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
  	puts "Activities: #{park.activities.join("; ")}"
  	puts ""  	
  	puts "Address: #{park.address}"
  	puts ""
  	puts "Phone: #{park.phone}"
  	puts ""
  	puts "Website: " + "https://www.mass.gov" + "#{park.url}"
  end

end #CLI

