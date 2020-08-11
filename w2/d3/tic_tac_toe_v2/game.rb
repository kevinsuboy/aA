require "byebug"
require_relative "./human_player.rb"
require_relative "./board.rb"
class Game
    # def initialize(player_1_mark, player_2_mark)
    def initialize(n, *player_marks)
        # debugger
        @player_arr = []
        player_marks.each do |mark|
            @player_arr.push(HumanPlayer.new(mark))
        end
        # @player_1 = HumanPlayer.new(player_1_mark)
        # @player_2 = HumanPlayer.new(player_2_mark)
        @player_N = 0
        @current_player = @player_arr[@player_N]
        @board = Board.new(n)
    end
    def switch_turn
        @player_N += 1
        @player_N %= @player_arr.length
        @current_player = @player_arr[@player_N]
    end
    def play
        while @board.empty_positions?
            @board.print
            begin
                "#{@current_player.mark}"
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