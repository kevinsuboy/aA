require_relative "./Player.rb"
require_relative "./AiPlayer.rb"
class Game
    # @@DICTIONARY = Hash.new { |h,k| h[k] = [] }
    @@DICTIONARY = Hash.new(false)
    IO.foreach("dictionary.txt"){|word| @@DICTIONARY[word.chomp] = true} # 
    # IO.foreach("dictionary.txt"){|word| @@DICTIONARY[word[0]] << word.chomp} # 
    # alphabetized

    # 26 letters... each letter key has n/26

    # "a" => {{100 words}}
    attr_reader :current_player, :previous_player ,:fragment
    def initialize
        puts "How many players?"
        input = gets.chomp.to_i
        @players = [] # Player_obj = [G,H,O]

        input.times do |i|
            puts "Player #{i} are you human?"
            ai = gets.chomp
            puts "Player #{i} what's your name?"
            if ai.downcase == "y"
                @players << AiPlayer.new(gets.chomp) 
            else
                @players << Player.new(gets.chomp) 
            end
        end #?

        @fragment = ""

        @current_player = @players[0]
        @previous_player = @players[-1] #?
    end
    
    def next_player!
        @previous_player = @current_player
        @current_player = @players[(@players.index(@current_player) + 1) % @players.length]
    end


    def take_turn(player)
        guess = player.guess
        count = 0
        until valid_play?(guess)
            guess = player.guess
            count += 1 
            if count == 2
                puts "It needs to be a letter that can maybe make a word"
            end
        end
        @fragment += guess
    end


    def valid_play?(char) # character guess
        # p "valid_play? char: #{char}"
        # p "valid_play? char length: #{char.length}"
        if char.length != 1 # errors
            puts "too many"
            return false
        end
        if !("a".."z").to_a.include?(char.downcase) # errors
            puts "not a letter"
            return false
        end
        @@DICTIONARY.keys.any? { |word| word.start_with?(@fragment + char.downcase) }## errors
    end

    # losses[player] = num_games_lost
    def lose_word? # update the players ghost, and reset fragment if needed
        ghost = "GHOST"
        if @@DICTIONARY[@fragment]
            @current_player.ghost << ghost[@current_player.ghost.length]
            puts "Hey #{@current_player.name} you lost the round, and your ghost is now #{@current_player.ghost}"
            @fragment = ""
            return true
        end
        return false
    end
    
    def done?
        if @previous_player.ghost.join("") == "GHOST"
            @players.delete(@previous_player)
            puts "---------------------------------------------"
            p "".l
            puts "---------------#{@previous_player.name} has lost and is outta here---------------"           
            puts "---------------------------------------------"
        end
        return @players.length == 1 #
    end
    
    def play_round
        self.take_turn(@current_player) # cp = AA ##
        # did current player just lose?
        self.lose_word? #cp = AA, ghos -> ghost
        self.next_player! # cp = BB
    end

    def run       
        while !self.done?
            self.display_standings
            self.play_round
            puts "The current string is : '#{fragment}' "
        end
        puts "#{@current_player.name} wins the game"
    end

    def display_standings
        p "------------ SCOREBOARD ------------"
        @players.each do |player|
            p "#{player.name}'s current readout is : #{player.ghost.join("")}"
        end
    end
end

if __FILE__ == $PROGRAM_NAME
    # p "hello world"
    g_1 = Game.new    
    g_1.run
end
