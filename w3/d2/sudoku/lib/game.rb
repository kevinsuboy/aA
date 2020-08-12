require 'byebug'
require_relative './board.rb'
require_relative './HumanPlayer.rb'

class Game
    def initialize(filename = nil, player_name = nil)
        if player_name
            @player = HumanPlayer.new(player_name)
        else
            @player = AiPlayer.new
        end
        @board = Board.create_from_file(filename)
    end
    def play
        until @board.solved?
            system("clear")
            @board.render
            val,x,y = @player.get_input
            @board.update_position([x,y],val) if @board.valid?([x,y], val)
        end
        system("clear")
        @board.render
        p "#{@player.name} WON"
    end

end

if __FILE__ == $PROGRAM_NAME
    g = Game.new("./puzzles/sudoku1_almost.txt","Fleshbag")
    g.play
end
