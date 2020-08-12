require_relative "./board.rb"
require_relative "./HumanPlayer.rb"
require_relative "./card.rb"
require_relative "./AiPlayer.rb"

class Game
    attr_reader :count
    def initialize(size=2, set=2, player_name=nil)
        @board = Board.new(size, set)
        if player_name
            @player = HumanPlayer.new(player_name)
        else
            @player = AiPlayer.new(@board)
        end
        @count = 0
    end
    def play
        until @board.won?
            play_round
            # sleep 0.5
        end
        puts "You won in #{@count} rounds"
    end
    def play_round
        #
        @count += 1
        guessed_pos_hash = {}
        @board.set.times do 
            system("clear") # cleared over here
            @board.render
            guessed_pos = []
            loop do
                guessed_pos = @player.get_input # terminal pauses here
                break unless guessed_pos_hash.has_key?(guessed_pos)
                p "Already guessed"
            end
            guessed_pos_hash[guessed_pos] = @board.reveal(guessed_pos)
            @player.get_feedback(guessed_pos, guessed_pos_hash[guessed_pos], false)
        end       
        system("clear") 
        @board.render
        #
        if guessed_pos_hash.values.uniq.length == 1
            p "Correct"
            guessed_pos_hash.each do |pos,face_value|
                @board.complete(pos)
                @player.get_feedback(pos, face_value, true)
            end
        else
            p "You suck"
            guessed_pos_hash.each do |pos,face_value|
                @board.hide(pos)
            end
        end
        # sleep 1
    end

end

if __FILE__ == $PROGRAM_NAME
    # g = Game.new(2,2,"Fleshbag")
    count = 0
    N = 100
    N.times do |i|
        g = Game.new(10,2)
        g.play
        count += g.count
    end
    p 1.0*count/N
end
