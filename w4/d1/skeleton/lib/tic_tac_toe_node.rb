require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :next_mover_mark, :prev_move_pos, :board
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    # board = Board<object_id XXX>
    # next_mover_mark = ":X"
    # prev_move_pos = potentially nil b/c you are starting
    # :X vs :O vs :Y on a 7x7 winning 3
    @board = board
    @next_mover_mark = next_mover_mark
    if @next_mover_mark == :x
      @prev_mover_mark = :o 
    else
      @prev_mover_mark = :x
    end
    @prev_move_pos = prev_move_pos
  end
  
  def losing_node?(evaluator) # will eval lose on this node?
    winner = @board.winner
    return !(!winner || winner==evaluator) if @board.over? # winner == nil and winner == us, return false
    @node_children = self.children
    #compare evaluator to next_mover_mark
      #"player turn" is @next_mover_mark... "evaluator" is the turn
      if evaluator == @next_mover_mark # my turn
        @node_children.all? {|child| child.losing_node?(evaluator) }
      else  # opponent's turn
        @node_children.any? {|child| child.losing_node?(evaluator) }
      end
  end

  def winning_node?(evaluator)
    winner = @board.winner
    return !(!winner || winner!=evaluator) if @board.over?
    @node_children = self.children
    if evaluator == @next_mover_mark
      @node_children.any?{|child| child.winning_node?(evaluator)}
    else
      @node_children.all?{|child| child.winning_node?(evaluator)}
    end
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    # @board = Board<id: 0x0000>
    res = [] # will resemble [Node<0x0000>, Node<0x0001,]
    (0...@board.rows.length).each do |idx1| # look through each row onn the board
      (0...@board.rows[0].length).each do |idx2| # look through each pos in this row
        move = [idx1,idx2]
        if @board.empty?(move) # && move != @prev_move_pos
          new_board = @board.dup
          new_board[move] = @next_mover_mark
          # @prev_move_pos = move
          res << TicTacToeNode.new(new_board, @prev_mover_mark , move)
        end
        
      end
    end
    res
  end
end
