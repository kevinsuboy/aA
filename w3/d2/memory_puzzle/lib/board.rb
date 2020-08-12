require_relative './card.rb'
require 'byebug'

class Board
    attr_reader :size, :set
    def initialize(size=2, set=2)
        if size%set != 0
            raise "cannot fill board"
            return false
        end
        @grid = Array.new(size){Array.new(size)} # create empty 2D grid
        @dictionary = {}
        @set = set
        @size = size
        populate
        return true
    end
    def populate
        pos_pairs = get_pos_pairs
        choose_space(pos_pairs) while pos_pairs.length > 0
    end
    def get_pos_pairs # helper to pop
        pos_pairs = []
        (0...@size).each {|i| (0...@size).each {|j| pos_pairs << [i, j]}}
        pos_pairs
    end
    def choose_space(pos_pairs) # helper to pop
        img = Card.choose_symbol(@dictionary)
        #
        # debugger
        @set.times do |x|
            pos = pos_pairs.sample
            pos_pairs.delete(pos)
            @grid[pos[0]][pos[1]] = Card.new(img)
        end
    end
    def won?
        @grid.all?{|row| row.all?{|card| card.solved}}
    end
    def reveal(guessed_pos)
        card_obj = @grid[guessed_pos[0]][guessed_pos[1]]
        card_obj.reveal
        card_obj.face_value
    end
    def hide(guessed_pos)
        # debugger
        card_obj = @grid[guessed_pos[0]][guessed_pos[1]]
        card_obj.hide
        card_obj.face_value
    end
    def complete(pos)
        card_obj = @grid[pos[0]][pos[1]]
        card_obj.to_s
    end
    def render
        str = []
        @size.times{|i| str<<i.to_s.ljust(5," ")}
        str = str.join
        p "#{" ".ljust(5," ")} #{str}"
        @grid.each_with_index do |row,i|
            str = []
            row.each{|el| str<<el.display.ljust(5," ")}
            # debugger
            str = str.join
            p "#{i.to_s.ljust(5," ")} #{str}"
        end
    end



end
if __FILE__ == $PROGRAM_NAME
    b = Board.new(2)
    b.render
    p b.won?
end