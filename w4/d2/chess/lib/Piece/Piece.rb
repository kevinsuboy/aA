# require_relative "../Board.rb"

class Piece
    attr_accessor :pos
    attr_reader :board, :symbol, :color # check this
    def initialize(color,board,pos)
        @color,@board,@pos = color,board,pos
        # @symbol = ""
        raise 'not a valid color' unless %i(red green).include?(color)
        raise 'not a valid position' unless @board.valid_pos?(pos)
    end
    def to_s
        self.symbol.colorize(self.color)
    end
    def empty?
    end
    # def valid_moves
    # end
    private
    def move_into_check?(end_pos)
    end
end