require 'byebug'

class Passenger
    attr_reader :name
    def initialize(name)
        @name = name
        @flight_numbers = []
    end
    def has_flight?(fl_num_str)
        # @flight_numbers.include?(fl_num_str.upcase)
        @flight_numbers.any?{|f| f.downcase == fl_num_str.downcase}
    end
    def add_flight(fl_num_str)
        @flight_numbers<<fl_num_str.upcase if !self.has_flight?(fl_num_str)
    end

end