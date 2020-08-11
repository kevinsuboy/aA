require "game"

describe "game" do
  let(:game) { Game.new(:X) }
  describe "V1" do
    describe "#initialize" do
      # An instance of Game should have instance variables for player one, player two, and the board. Design the #initialize method to accept the mark values to be used for the players.

      # You should also initialize an instance variable to contain the current player. By default, player one should begin as the current player.
    end
    describe "#switch_turn"
      # This method should set the current player to the other player. Calling this method repeatedly should switch the current player back and forth between the two players.

      # This method is critical for gameplay so be sure to test it in pry. Here is how our switching mechanic performs:


      # Notice how @current_player changes when we call #switch_turn. With that, we now have all the mechanics needed to put the game together!
    end
    describe "#play"
      # This method will contain the main game loop. Here is some psuedocode for the loop:

      # while there exists empty positions on the board
      # print the board
      # get a position from the current player
      # place their mark at that position of the board
      # check if that user has won
      # if they win, print out a 'victory' message saying who won and return to end the game
      # otherwise they did not win, so switch turns
      # if we finish the while loop without returning, that means there are no more empty positions on the board and noone has won, so print a 'draw' message
      # Test your game in pry. Play a few games by creating an instance of Game and invoking #play on it. After a game is over, be sure to create a new instance of Game to play again, this is the only way to get a fresh board. Some scenarios to test are: player one winning, player two winning, and a draw.

      # If any errors are raised during gameplay, your game loop and #play method will end immediately, so you'll have to start a new game and retry!
    end
  end
end
