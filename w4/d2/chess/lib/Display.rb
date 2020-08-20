require_relative "Cursor.rb" # does this also require "board"?
require_relative "Board.rb"

class Display
    def initialize(board)
        @board = board
        @cursor = Cursor.new([0,0],board)
    end
end


if __FILE__ == $PROGRAM_NAME
    b = Board.new
    d = Display.new(b)
end

