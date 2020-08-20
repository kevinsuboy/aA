require_relative "Piece.rb"

class Pawn < Piece
    def initialize(color,board,pos)
        @symbol = '♟'
        super(color,board,pos)
    end
    def moves
        res = []
        new_pos = [self.pos[0]+forward_dir,self.pos[1]]
        if self.board.valid_pos?(new_pos) && self.board[new_pos]==nil # res [-1]
            res = [new_pos]
            res << [self.pos[0]+2*forward_dir,self.pos[1]] if at_start_rows?
        end
        # res [-1, -2]
        res << side_attacks
    end
    private
    def at_start_rows?
        (self.pos[0] == 1 && self.color == :red) || (self.pos[0] == 6 && self.color == :green)
    end
    def forward_dir
        # debugger
        return 1  if self.color == :red # top piece
        return -1 if self.color == :green # bottom
    end
    def side_attacks
        dir = forward_dir
        res = []
        new_pos = self.pos[0]+dir,self.pos[1]+1
        # debugger if self.board[new_pos].nil?
        piece = self.board[new_pos]
        if self.board.valid_pos?(new_pos) && piece && piece.color != self.color
            res += new_pos
        end
        new_pos = self.pos[0]+dir,self.pos[1]-1
        piece = self.board[new_pos]
        if self.board.valid_pos?(new_pos) && piece && piece.color != self.color
            res += new_pos
        end
        res
    end
end
