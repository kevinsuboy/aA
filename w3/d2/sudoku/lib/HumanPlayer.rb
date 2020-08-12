require 'byebug'

class HumanPlayer
    attr_reader :name
    def initialize(name = "Fleshbag")
        @name = name
    end
    def get_input
        p "#{@name}, enter value and pos"
        loop do
            l = gets.chomp
            raise "wrong" if l=="quit"
            val, x, y = l.split.map{|c| c.to_i}
            return [val,x,y] if val && x && y
            p "invalid"
        end
    end
end


