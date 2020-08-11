require "byebug"
class HumanPlayer
    attr_reader :mark
    def initialize(mark)
        @mark = mark
    end
    def get_position
        num = "0123456789"
        p "enter position"
        input = gets.chomp
        raise StandardError if input.split(' ').length != 2
        position = []
        input.split(' ').each do |c|
            raise StandardError unless c.chars.all? {|char| num.include?(char)}
            position.push(c.to_i)
        end
        position
    end
end