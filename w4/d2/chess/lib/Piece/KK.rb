require_relative "Piece.rb"
require_relative "modules/Stepable.rb"

class KK < Piece
    TYPE = {:Kn => '♞', :K => '♚'}
    
    include Stepable
    def initialize(type,color,board,pos)
        raise 'not a valid type' unless TYPE.has_key?(type)
        @symbol = TYPE[type] # :R :B or :Q
        super(color,board,pos)
    end
    protected
    def move_dirs
        case self.symbol
        when '♞'
            KNIGHT_DIR
        when '♚'
            KING_DIR
        end
    end
    private
    KING_DIR = [
        [ 1, 0],
        [-1, 0],
        [ 0, 1],
        [ 0,-1],
        [ 1, 1],
        [-1,-1],
        [ 1,-1],
        [-1, 1]
    ]

    KNIGHT_DIR = [
                    [ 2, 1],
                    [ 2,-1],
                    [-2, 1],
                    [-2,-1],
                    [ 1, 2],
                    [-1, 2],
                    [ 1,-2],
                    [-1,-2]
                ]
end
