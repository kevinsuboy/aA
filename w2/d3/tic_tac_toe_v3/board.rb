require "byebug"

class Board
    def initialize(n)
        @grid = Array.new(n){Array.new(n,"_")}
    end
    def valid?(pos)
        pos[0] < @grid.length && pos[1] < @grid.length && pos[0] >= 0 && pos[1] >= 0
    end
    def empty?(pos)
        @grid[pos[0]][pos[1]] == "_"
    end
    def place_mark(pos, mark)
        raise StandardError.new("position invalid") unless self.valid?(pos)
        raise StandardError.new("position filled") unless self.empty?(pos)
        @grid[pos[0]][pos[1]] = mark
    end
    def print
        @grid.each {|row| puts row.join(" ")}
    end
    def win_row?(mark)
        @grid.any? {|row| row.all?{|ele| ele==mark}}
    end
    def win_col?(mark)
        @grid.transpose.any? {|row| row.all?{|ele| ele==mark}}
    end
    def win_diagonal?(mark)
        ul_br = true
        i = @grid.length-1
        j = 0
        while i >= 0
            ul_br &= @grid[i][j] == mark
            i -= 1
            j += 1
        end
        i = 0
        j = 0
        bl_ur = true
        while i<@grid.length
            bl_ur &= @grid[i][j] == mark
            i += 1
            j += 1
        end
        return bl_ur || ul_br
        #[0][0], [1][1] ++
        #[3][0], [2][1], [1][2], [0][3] -+
    end
    def win?(mark)
        self.win_row?(mark) || self.win_col?(mark) || self.win_diagonal?(mark)
    end
    def empty_positions?
        res = false
        @grid.each_with_index do |row,i|
            row.each_with_index do |ele, j|
                res ||= self.empty?([i,j])
            end
        end
        res
    end
    def legal_positions
        positions = []
        @grid.each_with_index do |row,i|
            @grid.each_with_index do |el,j|
                positions.push([i,j]) if self.valid?([i,j]) && self.empty?([i,j])
            end
        end
        positions
    end
    def clear_board
        @grid.map!{|row| row.map!{|ele| ele = "_"}}
    end
end