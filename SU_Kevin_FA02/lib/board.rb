class Board
    attr_reader :size
    def initialize(size)
        @size = size
        @grid = Array.new(size){Array.new(size)}
    end
    def [](pos)
        @grid[pos[0]][pos[1]]
    end
    def []=(pos,mark)
        @grid[pos[0]][pos[1]] = mark
    end
    def complete_row?(mark)
        @grid.each do |row|
            return true if row.all?{|el| el == mark}
        end
        return false
    end
    def complete_col?(mark)
        @grid.transpose.each do |row|
            return true if row.all?{|el| el == mark}
        end
        return false
    end
    def complete_diag?(mark)
        i = 0
        i+=1 while i<@size && @grid[i][i]==mark
        ul_br = i == @size
        i = 0
        i+=1 while i<@size && @grid[@size-1-i][i]
        ur_bl = i == @size
        return ul_br || ur_bl
    end
    def winner?(mark)
        complete_row?(mark) || complete_diag?(mark) || complete_col?(mark)
    end
    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @grid.each { |row| p row }
    end
end
