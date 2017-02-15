class Planet
  attr_reader :name ,:travel_time, :length_of_day, :gravity_ratio, :mean_temperature# degrees C
  
  def initialize(hash)
    @name = hash[:planet].capitalize.to_sym
    @gravity_ratio = hash[:gravity] / 9.8
    @length_of_day = hash[:day_length]
    @mean_temperature =  hash[:temp]
    @travel_time = hash[:time]
  end
  
  def print_journey(weight)
    puts "\nIt will take us #{@travel_time} to get to #{@name.capitalize}.  The mean temperature will be #{@mean_temperature} degrees C, and one \"day\" \(planet rotation\) will be equal to #{@length_of_day} earth hours.  You will weigh #{sprintf("%.1f", weight * @gravity_ratio)} pounds\n\n"
  end
end

# source:  http://nssdc.gsfc.nasa.gov/planetary/factsheet/

# travel time source:  http://www.astronomycafe.net/qadir/BackTo343.html

mercury = Planet.new(planet: "mercury", gravity: 3.7, day_length: 4222.6, temp: 167, time: "53 days")
venus = Planet.new(planet: "venus", gravity: 8.9, day_length: 2802, temp: 464,time: "100 days")
earth = Planet.new(planet: "earth", gravity: 9.8, day_length: 24.0, temp: 15, time: "0 days")
mars = Planet.new(planet: "mars", gravity: 1.6, day_length: 708.7,temp: -20, time: "210 days")
jupiter = Planet.new(planet:  "jupiter", gravity: 3.7, day_length: 24.7, temp: -65, time: "1.9 years")
saturn = Planet.new(planet: "saturn", gravity: 23.1, day_length: 10.7,temp: -110, time: "7.3 years")
uranus = Planet.new(planet: "uranus", gravity: 9.0, day_length: 17.2, temp: -140, time: "0 days")
neptune = Planet.new(planet: "neptune", gravity: 8.7, day_length: 16.1, temp: -195, time:"11.4 years")
pluto = Planet.new(planet:"pluto", gravity: 11.0, day_length: 153.3, temp: -200, time: "15.1 years")



class SolarSystem
  attr_reader :solar_system
  
  def initialize
    @solar_system = []
  end
  
  def add_planet(planet)
    if planet.is_a? (Array)
      planet.each do |new_planet|
        @solar_system << new_planet
      end
    else
      @solar_system << planet
    end
  end
  
  def print_all_planets
    @solar_system.each do |new_planet|
      print "#{new_planet.name}, "
    end
  end
  
  def valid_planet?(destino)
    @solar_system.each do |new_planet|
      if new_planet.name.to_s == destino
        puts "Yay!  We are going to go to #{destino}"
        return true
      end
    end
    print "I'm sorry...I don't know how to get to #{destino}"
    return false
  end
  
  def subset_planet(destino, wt)
    @solar_system.each do |new_planet|
      if new_planet.name.to_s == destino
        new_planet.print_journey(wt)
      end
    end
  end
end

galaxy = SolarSystem.new
galaxy.add_planet([mercury,venus, venus, earth, mars, jupiter, saturn, uranus, neptune, pluto])
####################################################################################

puts "\nHello there, astronaut friend!  Let's journey to an exciting planet."

valid_planet = false
until  valid_planet
  print "\n\nWe can go to "
  galaxy.print_all_planets
  print " Where would you like to go? "
  destination = gets.chomp.strip.capitalize
  valid_planet = galaxy.valid_planet?(destination)
end

print "For purposes of shuttle safety, please enter your weight in pounds: "
weight = gets.chomp.to_i

galaxy.subset_planet(destination, weight)
