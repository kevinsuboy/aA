require "byebug"
require_relative "./human_player.rb"
require_relative "./board.rb"
class Game
    def initialize(player_1_mark, player_2_mark)
        @player_1 = HumanPlayer.new(player_1_mark)
        @player_2 = HumanPlayer.new(player_2_mark)
        @current_player = @player_1
        @board = Board.new()
    end
    def switch_turn
        if @current_player == @player_1
            @current_player = @player_2
        else
            @current_player = @player_1
        end
    end
    def play
        while @board.empty_positions?
            @board.print
            begin
                position = @current_player.get_position
                @board.place_mark(position, @current_player.mark)
            rescue StandardError => e
                p "#{e.message}"
                retry
            end
            if @board.win?(@current_player.mark)
                p "victory"
                p "#{@current_player.mark} won!"
                return
            else
                self.switch_turn
            end
        end
        p "draw"
        return
    end
end