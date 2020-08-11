require "byebug"
class HumanPlayer
    attr_reader :mark
    class QuitError < StandardError
    end
    def initialize(mark)
        @mark = mark
    end
    def get_position(legal_positions)
        num = "0123456789"
        p "enter position"
        input = gets.chomp
        raise QuitError.new if input == "quit"
        raise StandardError if input.split(' ').length != 2
        position = []
        input.split(' ').each do |c|
            raise StandardError unless c.chars.all? {|char| num.include?(char)}
            position.push(c.to_i)
        end
        legal_positions.include?(position)
        position
    end
end