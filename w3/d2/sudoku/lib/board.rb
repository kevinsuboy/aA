require 'byebug'
require_relative './tile.rb'

class Board
    def initialize(board_arr = nil)
        # board_arr ||= Array.new(9){Array.new(9,0)}
        @board_arr = board_arr
    end
    def self.create_from_file(filename=nil)
        arr = []
        if filename
            File.foreach(filename) do |line|
                arr << line.chomp.split("").map{|c| Tile.new(c.to_i,c.to_i!=0)}
            end
        else
            9.times do |i|
                arr << 9.times.map{|i| Tile.new(0,false)}
            end
        end
        Board.new(arr)
    end
    def [](pos)
        @board_arr[pos[0]][pos[1]]
    end
    def []=(pos,value)
        self[pos] = value
    end
    def self.create_random_board
    end
    def update_position(pos, val)
        return false if self[pos].given || (!val.is_a?(Integer)) || val > 9 || val < 0
        self[pos].value = val
    end
    def render
        (0...9).each do |i|
            row = ""
            (0...9).each do |j|
                l = ""
                l = "||" if (j+1) % 3 == 0 && j<8
                row += "#{@board_arr[i][j].display}" + l
            end
            puts row
            p "".ljust(50,"=") if (i+1) % 3 == 0
        end
    end
    def solved?
        all_rows_solved? && all_cols_solved? && all_squares_solved?
    end
    def all_rows_solved?
        @board_arr.all? do |row|
            return false if row.any?{|tile| tile.value == 0}
            row.map{|tile| tile.value}.uniq.length == 9
        end
    end
    
    def all_cols_solved?
        @board_arr.transpose.all? do |col|
            return false if col.any?{|tile| tile.value == 0}
            col.map{|tile| tile.value}.uniq.length == 9
        end
    end
    
    def all_squares_solved?
        [0,3,6].each do |x|
            [0,3,6].each do |y|
                return false unless square_solved?([x,y])
            end
        end
        return true
    end
    def square_solved?(pos)
        x,y = pos[0],pos[1]
        arr = []
        (x...x+3).each do |i|
            (y...y+3).each do |j|
                # debugger
                return false if @board_arr[i][j].value == 0
                arr << @board_arr[i][j].value
            end
        end
        arr.uniq.length == 9
    end
    def valid?(pos,val)
        valid_row?(pos,val) && valid_col?(pos,val) && valid_square?(pos,val)
    end
    def valid_row?(pos,val)
        !@board_arr[pos[0]].include?(val)
    end
    def valid_col?(pos,val)
        !(@board_arr.transpose)[pos[1]].include?(val)
    end
    def valid_square?(pos,val)
        x,y = 3*(pos[0]/3),3*(pos[1]/3)
        (x...x+3).each do |i|
            (y...y+3).each do |j|
                # debugger
                return false if @board_arr[i][j].value == val
            end
        end
        return true
    end
end

if __FILE__ == $PROGRAM_NAME
    b = Board.create_from_file("./puzzles/sudoku1.txt")
    # b = Board.create_from_file
    # b.render
    # p b.square_solved?([0,0])
    # p b.square_solved?([3,6])
    # p b.square_solved?([6,6])
    # p b.all_squares_solved?
    # p b.all_cols_solved?
    # p b.all_rows_solved?
    # p b.solved?
    # p b.update_position([0,0],70)
    b.render
end
