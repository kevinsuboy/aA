# require_relative "../../Board.rb"
require 'byebug'
module Slideable
    
    # needs to use self.move_dirs
    # needs to use Board stuff {self.board}
    # def moves(board_obj)
    def horizontal_dirs
        HORIZONTAL_DIRS
    end
    def diagonal_dirs
        DIAGONAL_DIRS
    end
    def moves
        # uses move_dirs (array of all unit dir vectors), and generating a list of moves based on Board.empties
        # debugger
        unit_dir = move_dirs
        debugger if unit_dir.length > 8
        res = []
        # each dir, keep incrementing and adding to moves until my own piece
        unit_dir.each do |dir|
            res.concat(grow_unblocked_moves_in_dir(dir[0],dir[1]))
        end
        res
        # [all NW, all NE] northwest 
        # on next turn [all NW, all NE]
    end
    # calling it would look like self.moves(self.board)
    private
    HORIZONTAL_DIRS = [
        [ 1, 0],
        [-1, 0],
        [ 0, 1],
        [ 0,-1]
    ]
    DIAGONAL_DIRS = [
        [ 1, 1],
        [-1,-1],
        [ 1,-1],
        [-1, 1]
    ]
    def move_dirs
        # move everywhere (like a Q)
        # uses horizontal_dirs and diagonal_dirs to return a complete array of potential unit dir vectors
        # horizontal_dirs.concat(diagonal_dirs)
        raise "declare your own"
    end
    def grow_unblocked_moves_in_dir(dx,dy) # expanded into the unit dir
        # i.e. if given NW, find all possible NW moves
        # debugger if [dx,dy] == [0,1] # E
        new_pos = [self.pos[0]+dx,self.pos[1]+dy]
        res = []
        while self.board.valid_pos?(new_pos) && self.board[new_pos]==nil
            res << new_pos
            new_pos = [new_pos[0]+dx,new_pos[1]+dy]
        end
        res << new_pos if self.board.valid_pos?(new_pos) && self.board[new_pos].color != self.color # we either terminated while loop when exceeding or when its not empty... attack if enemy
        res
    end
end

if __FILE__ == $PROGRAM_NAME
    include Slideable
    p move_dirs
end