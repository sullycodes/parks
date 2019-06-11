class CLI 

  def call
    Scraper.new.make_parks
    puts "Welcome to Massachusetts State Parks!"
    puts ""
    puts "Please enter the park number from the list below to learn more about it:"
    puts ""
    start
  end

  def start
  	list_parks

  end

  def list_parks
  
  end

  def display_park(park)
  	puts "#{park.name}"
  	puts ""
  	puts "Address: #{{}}"
  end

end #CLI