require_relative './airport'
require_relative 'flight'
require_relative './passenger.rb' # All of these work because Ruby is clever. 

airport = Airport.new('London Heathrow')

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

    add_flight(number_of_seats, destination)
  when '2'  # List flights
  when '3'  # Add a passenger to flight
  when '4'  # List passengers on a flight
  end

  response = menu

end