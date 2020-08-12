class HumanPlayer
    def initialize(name = "Fleshbag")
        @name = name
    end
    def get_input
        p "#{@name}, enter a position to guess"
        str = gets.chomp
        raise "quit" if str=="quit"
        pos = str.split.map {|el| el.to_i}
    end
    def get_feedback(pos, face_value, solved)
        return
    end
end


if __FILE__ == $PROGRAM_NAME
    h = HumanPlayer.new
    p h.get_input
end