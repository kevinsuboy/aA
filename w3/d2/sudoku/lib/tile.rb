require 'byebug'
require 'colorize'
require 'colorized_string'

class Tile
    attr_reader :value, :given, :pot_value
    def initialize(value=nil, given = false)
        @value = value
        @given = given
        @pot_value = Hash.new(false)
    end

    def display
        @value == 0 ? val = ".".ljust(5," "): val = @value.to_s.ljust(5, " ")
        (@given ? val.colorize(:blue) : val.colorize(:red)).ljust(5," ")
    end
    def value=(val)
        return false if @given || (!val.is_a?(Integer)) || val > 9 || val < 0
        @value = val
    end
end

if __FILE__ == $PROGRAM_NAME
    t = Tile.new(9, true)
    t.display
end

