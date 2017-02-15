#create the class Planet with read/write variables and an initalize method
class Planet
  attr_accessor :name, :slot, :size, :namesake, :moon_count, :export, :distance_from_sun
  def  initialize(address_hash)
    @name = address_hash[:name]
    @slot = address_hash[:slot]
    @size = address_hash[:size]
    @namesake = address_hash[:namesake]
    @moon_count = address_hash[:moon_count]
    @export = address_hash[:export]
    @distance_from_sun = address_hash[:distance_from_sun]
  end
end

#create the Solar System class with read/write variables
class Solar_System
  attr_accessor :planets
  
  #method to initalize the solar system from the address hash
  def initialize
    @planets = {}
  end
  
  #method to print all the planets in teh solar system
  def show_planets
    @planet_names = planets.keys{:name}
  end
  
  #method to add individual planets in the solar system hash
  def build_system(name, planet)
    @planets[name] = planet
  end
  
  #method to calculate the distance between planets
  def distance_apart(planet1, planet2, abs = true)
    distance = planet1.distance_from_sun - planet2.distance_from_sun
    return distance.abs
  end
  
end

#create an array of planet hashes
milky_way = [
  {:name => "Mercury",:slot => "first",:size=>  "Small",:namesake=> "in Latin, for the Greek diety Hermes", :moon_count=>  "0", :export=>  "speed" , :distance_from_sun=> 0.39},
    {:name=> "Venus",:slot=> "2nd", :size=> "Mejum", :namesake=> "in Latin, for the Greek diety Aphrodite",:moon_count=> "3", :export=> "women", :distance_from_sun=> 67.2},
    {:name=>  "Earth",:slot=> "3rd", :size=> "Mejum", :namesake=> "for the Middle English translation \"eorðe\" of the Greek goddes Gaia",:moon_count=> "1", :export=>  "people", :distance_from_sun=> 1},
    {:name=>  "Mars",:slot=>  "4th", :size=>  "Mejumish", :namesake=>  "in Latin, for the Greek diety, Ares", :moon_count=>  "0", :export=>  "men", :distance_from_sun=> 1.524},
    {:name=>  "Jupiter",:slot=>  "5th", :size=>  "Huge", :namesake=>  "in Latin, for the Greek diety,Zues", :moon_count=>  "4", :export=>  "red dots", :distance_from_sun=> 5.203},
    {:name=>  "Saturn",:slot=>  "6th", :size=>  "Big", :namesake=>  "in Latin, for the Greek diety,Saturn", :moon_count=>  "8", :export=>  "baby eating", :distance_from_sun=> 9.539},
    {:name=>  "Neptune",:slot=>  "8th", :size=>  "Big", :namesake=>  "for the Greek diety Ouranos", :moon_count=>  "1", :export=>  "sky", :distance_from_sun=>30.06},
    {:name=>  "Uranus",:slot=>  "7th", :size=>  "Big", :namesake=>  "in Latin, for the Greek diety,Posieden", :moon_count=>  "1", :export=>  "oceans", :distance_from_sun=> 19.18}
  ]
  
  gamma = Solar_System.new
  milky_way.each_with_index do |planet, index|
    gamma.build_system(planet[:name], Planet.new(milky_way[index]))
  end
  
  bajor = Planet.new({:name => "Bajor",:slot => "cardassians are the worst", :size=>  "exploitable", :namesake=> "cardassians are the worst", :moon_count=>  "they have a freakin wormhole!", :export=>  "Ore processed on Terok Nor" , :distance_from_sun=> 500000000})
  gamma.build_system("bajor",bajor)
  
  #set variable for sentinal loop  
  chosen_planet = nil
  puts "Welcome to the Queues Class Planet Tutor"

  #display planets
  milky_way.each_with_index do |name,index|
    puts "#{index + 1}. #{name[:name].capitalize}"
  end
  
  #get user input and create variable to interact with it
  until chosen_planet
    puts "What planet would you like to learn about today?"
    user_planet = gets.chomp
    case user_planet.downcase
    when "mercury"
      chosen_planet = milky_way[0][:name].capitalize
    when "venus"
      chosen_planet = milky_way[1][:name].capitalize
    when "earth"
      chosen_planet = milky_way[2][:name].capitalize
    when "mars"
      chosen_planet = milky_way[3][:name].capitalize
    when "jupiter"
      chosen_planet = milky_way[4][:name].capitalize
    when "saturn"
      chosen_planet = milky_way[5][:name].capitalize
    when "uranus"
      chosen_planet = milky_way[6][:name].capitalize
    when  "neptune"
      chosen_planet = milky_way[7][:name].capitalize
    else
      puts "choose a planet!"
    end  
  end
  
  #get user input to execute .distance_apart
  puts "You chose #{gamma.planets[chosen_planet].name}! That's a great planet! Choose a second planet to find out how far away it is from #{gamma.planets[chosen_planet].name}."
  second_planet = gets.chomp.downcase.capitalize
  puts "Your planets are #{gamma.distance_apart(gamma.planets[chosen_planet], gamma.planets[second_planet])} AUs apart"
