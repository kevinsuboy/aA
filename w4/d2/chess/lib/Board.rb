require_relative "Piece/KK.rb"
require_relative "Piece/NullPiece.rb"
require_relative "Piece/Pawn.rb"
require_relative "Piece/RBQ.rb"

require 'byebug'

class Board
    attr_reader :rows
    def initialize
        # @rows = Array.new(8){Array.new(8,NullPiece.instance)}
        @rows = Array.new(8){Array.new(8)}
        # BLACK
        # R K B Q K B K R

        (0...8).each{|i| @rows[1][i] = Pawn.new}
        # WHITE

    end
    def [](pos)
        i,j = pos[0],pos[1]
        @rows[i][j]
    end
    def []=(pos,val)
        i,j = pos[0],pos[1]
        @rows[i][j] = val
    end
    # def move_piece(color, start_pos, end_pos)
    def move_piece(start_pos, end_pos) # team 1 or 2
        raise "no piece" if (!self[start_pos] || self[end_pos]) # start is not piece, or end is a piece... NOTE: no consideration of teams yet
        self[end_pos] = self[start_pos]
        self[start_pos] = nil
    end
    # def move_piece!(color, start_pos, end_pos)
    def move_piece!(start_pos, end_pos) # team 1 or 2
    end
    def valid_pos?(pos)
    end
    def add_piece(piece,pos)
    end
    def checkmate?(color)
    end
    def in_check?(color)
    end
    def find_king(color)
    end
    def pieces
    end
    def dup
    end
    def display
        p ""
        @rows.each do |row|
            # debugger
            str = row.map do |el|
                if el
                    "P"
                else
                    "."
                end
            end.join
            p str
        end
    end
    private
    attr_reader :sentinel
end

def test_1(b)
    pos_a = [rand(0..7), rand(0..7)] #pos_a = [[x],[y]]
    pos_b = [rand(0..7), rand(0..7)] #pos_a = [[x],[y]]
    b.move_piece(pos_a,pos_b)
    b.display
end

if __FILE__ == $PROGRAM_NAME
    b = Board.new
    5.times do |i|
        begin
            test_1(b)
        rescue => exception
            retry
        end
    end
end
