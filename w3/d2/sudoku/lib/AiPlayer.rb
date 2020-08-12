require 'byebug'

class AiPlayer
    @@AI_num = 0
    attr_reader :name
    def initialize(board)
        @board = board
        @name = "Machine #{@@AI_num}"
        @@AI_num += 1
    end
    def get_input
        p "#{@name}, enter value and pos"
        
    end
end


