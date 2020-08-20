module Stepable
    def moves
        dirs = move_dirs
        res = []
        dirs.each do |dir|
            new_pos = self.pos[0]+dir[0],self.pos[1]+dir[1]
            if self.board.valid_pos?(new_pos) && (self.board[new_pos]==nil || self.board[new_pos].color != self.color)
                res << new_pos
            end
        end
        res
    end
    private
    def move_dirs
        raise 'you need to define this'
    end
end