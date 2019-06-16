require_relative '../config/environment'

class CLI 

  def run
    make_parks
    greeting
    list_parks
  end

  def greeting
  	clear_screen
	puts "Welcome to Massachusetts State Parks! Home to over 150 beautiful, scenic, and impeccably maintained parks."
    puts ""
  end

  def goodbye
  	clear_screen
  	puts "Thanks for visiting Massachusetts State Parks!"
  end


  def clear_screen
	system "clear" or system "cls"
    2.times do puts "" end
  end


  def invalid
  	puts ""
  	puts "Invalid entry."
  	start_over?
  end


  def start_over?
  	puts ""
  	puts ""
  	puts "Would you like to start over? (y/n)?"
  	input = gets.chomp
  	if input == "y" || input == "Y"
  		clear_screen
  		greeting
  		list_parks
  	else
  		goodbye
  	end
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
	choose_text = "Enter the number of the park you like to see or ENTER \"m\" for more Massachusetts State Parks."

	Park.all[0..29].flatten.each_with_index do |e,i|  		
  		puts "#{i+1}. #{e.name}"
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
							else
  								invalid
  						end #if/elsif/else 4
					else
  						invalid
  					end #if/elsif/else 3
  			else
  				invalid
  			end #if/elsif/else 2
  	else 
  		invalid
  	end #if/elsif/else 1

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
  	clear_screen
  	park_url = park.url
  	park.add_park_attributes(park_url)
  	puts ""
  	puts ""  	
  	puts "#{park.name.upcase}"
  	puts ""
  	puts "*******************************************************"
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
  	start_over?
  end

end #CLI

