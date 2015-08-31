class Flight

attr_reader :number_of_seats
attr_accessor :destination, :passengers

  def initialize(number_of_seats, destination)
    @number_of_seats = number_of_seats
    @destination = destination
    @passengers = []
  end

end