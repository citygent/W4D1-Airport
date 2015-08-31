require_relative './airport'
require_relative './flight'
require_relative './passenger.rb' # All of these work because Ruby is clever. 

lhr = Airport.new('London Heathrow')

#this doesn't need to be in airport because it's ACCESSING, not changing anything like add_flight was.
def list_flights airport
  airport.flights.each_with_index {|flight, index| puts "#{index}: #{flight}"}
  end

def list_passenger flight
  flight.passengers.each_with_index { |passenger, index| puts "#{index}: #{passenger.name}"}
end

def menu
  puts `clear` #Black Magic!
  puts '*' * 52
  puts "Welcome to London Heathrow!".center 50 # MORE Black Magic
  puts '*' * 52
  puts '1: Add a flight'
  puts '2: List flights'
  puts '3: Add a passenger to flight'
  puts '4: List passengers on a flight'
  puts 'q : Quit'
  print '-->'
  gets.chomp
end

response = menu #method call, return value is whatever is last to run.

while response.downcase != 'q'
  case response
  when '1'  # Add a flight
    puts 'How many passengers on this flight?'
    number_of_seats = gets.to_i
    puts 'What is the flight\'s destination?'
    destination = gets.chomp

    puts lhr.add_flight(number_of_seats, destination)
    gets
  when '2'  # List flights
    puts 'Here are all the of the flights:'
    list_flights(lhr)
    gets
  when '3'  # Add a passenger to flight
    puts ' What\'s the passengers name?'
    name = gets.chomp
    passenger = Passenger.new(name)

    puts "Which flight do you want #{passenger.name} to be added to?"
    list_flights(lhr) #list flights so it can be selected.
    flight_number = gets.to_i
    flight = lhr.flights[flight_number]

    flight.add_passenger(passenger)
    puts "#{passenger.name} has been added to #{flight}"
    gets

  when '4'  # List passengers on a flight
    # List flightings   
    puts 'What flight do you want to list the passengers from?'
    list_flights(lhr)

    # choose flightings
    flight_number = gets.to_i
    flight = lhr.flights[flight_number]
    # loop thru passengers array
    puts 'The passengers for this flight are: '
    list_passengers(flight)
    gets
  end

  response = menu

end
