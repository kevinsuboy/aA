require_relative 'tic_tac_toe_node'

class SuperComputerPlayer < ComputerPlayer
  def move(game, mark)
    # make TicTacToe node from game->board
    # are any of the children winners for mark? if so, return the move that conceived that children

    # root_node(game->board).each_child
      # return "conception move" if child wins (because i want to make that child)
    strategy = TicTacToeNode.new(game.board, mark)
    strategy.children.each do |child|
      return child.prev_move_pos if child.winning_node?(mark)
    end
    strategy.children.each do |child|
      return child.prev_move_pos if !child.losing_node?(mark)
    end
    raise "I can't possible get out of this"
  end
end

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = SuperComputerPlayer.new
  # hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new
  TicTacToe.new(hp, cp).run
end
