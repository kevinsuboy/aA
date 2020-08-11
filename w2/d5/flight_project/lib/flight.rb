class Flight
    attr_reader :passengers
    def initialize(flight_number, capacity)
        @flight_number = flight_number
        @capacity = capacity
        @passengers = []
    end

    def full? # inst method
        @passengers.length >= @capacity
    end
    
    def board_passenger(passenger_inst)
        @passengers << passenger_inst if passenger_inst.has_flight?(@flight_number) && !self.full?
    end 

    def list_passengers
        @passengers.map {|p| p.name }
    end 
    def [](i)
        @passengers[i]
    end 

    def <<(passenger_inst)
        self.board_passenger(passenger_inst)
    end 

end
