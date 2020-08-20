require_relative "Piece/KK.rb"
require_relative "Piece/NullPiece.rb"
require_relative "Piece/Pawn.rb"
require_relative "Piece/RBQ.rb"

require 'colorize'

require 'byebug'

class Board
    attr_reader :rows
    def initialize
        @rows = Array.new(8){Array.new(8,NullPiece.instance)}
        # @rows = Array.new(8){Array.new(8)}
        # BLACK (RED)
        # R K B Q K B K R

        @rows[0][0] = RBQ.new(:R,:red,self,[0,0])
        @rows[0][1] =  KK.new(:Kn,:red,self,[0,1])
        @rows[0][2] = RBQ.new(:B,:red,self,[0,2])
        @rows[0][3] = RBQ.new(:Q,:red,self,[0,3])
        @rows[0][4] =  KK.new(:K,:red,self,[0,4])
        @rows[0][5] = RBQ.new(:B,:red,self,[0,5])
        @rows[0][6] =  KK.new(:Kn,:red,self,[0,6])
        @rows[0][7] = RBQ.new(:R,:red,self,[0,7])
        # (0...8).each{|i| @rows[1][i] = Pawn.new(:red,self,[1,i])}
        
        
        # WHITE (GREEN)
        @rows[7][0] = RBQ.new(:R,:green,self,[7,0])
        @rows[7][1] =  KK.new(:Kn,:green,self,[7,1])
        @rows[7][2] = RBQ.new(:B,:green,self,[7,2])
        @rows[7][3] = RBQ.new(:Q,:green,self,[7,3])
        @rows[7][4] =  KK.new(:K,:green,self,[7,4])
        @rows[7][5] = RBQ.new(:B,:green,self,[7,5])
        @rows[7][6] =  KK.new(:Kn,:green,self,[7,6])
        @rows[7][7] = RBQ.new(:R,:green,self,[7,7])
        # (0...8).each{|i| @rows[6][i] = Pawn.new(:green,self,[6,i])}
        
        # @rows[5][6] = RBQ.new(:R,:red,self,[5,7])
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
        self[end_pos] = self[start_pos] # only Board is updating
        self[end_pos].pos = end_pos #self[] is a Piece obj_id, update the Piece with pos as well... so it can generate moves
        self[start_pos] = nil
    end
    # def move_piece!(color, start_pos, end_pos)
    def move_piece!(start_pos, end_pos) # team 1 or 2
    end
    def valid_pos?(pos) # understanding of "within bounds"
        (0..7).include?(pos[0]) && (0..7).include?(pos[1])
        # self[pos] == nil # probably need to check for NULL
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
    def update_moves(symbol, moves,color)
        moves.each do |move|
            x,y = move
            @rows[x][y] = [symbol,color]
        end
    end
    def display
        p ""
        @rows.each do |row|
            # debugger
            str = row.map do |piece|
                if !piece.is_a?(Array)
                    # "P"
                    if piece
                        piece.to_s
                    else
                        "."
                    end
                    # piece.symbol
                else
                    piece[0].colorize(piece[1])
                end
            end.join
            puts str
        end
    end
    private
    attr_reader :sentinel
end

def test_1(b)
    pos_a = [rand(0..7), rand(0..7)] #pos_a = [[x],[y]]
    pos_b = [rand(0..7), rand(0..7)] #pos_a = [[x],[y]]
    b.move_piece(pos_a,pos_b)
    # b.display
end

def test_2(b)
    # b.display
    # [0,7].each do |i|
    b.rows.each do |row|
        row.each do |piece|
            if piece && !piece.is_a?(Array)
                puts piece.to_s
                m = piece.moves
                p m
                p m.length
                # b.update_moves(piece.symbol,m,piece.color)
            end
        end
    end
end

if __FILE__ == $PROGRAM_NAME
    b = Board.new
    # p b[[0,0]].moves # rook
    1.times do |i|
        # begin
            # test_1(b)
            test_2(b)
            b.display
        # rescue => exception
        #     p exception.message
        #     debugger
        #     retry
        # end
    end
end
