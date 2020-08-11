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
        i = 0
        j = @grid.length-1
        while i<@grid.length
            return false unless @grid[i][j] == mark
            i += 1
            j -= 1
        end
        i = 0
        j = 0
        while i<@grid.length
            return false unless @grid[i][j] == mark
            i += 1
            j += 1
        end
        true
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
end