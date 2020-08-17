require 'byebug'
require_relative '../../PolyTreeNode/lib/00_tree_node.rb'

class KnightPathFinder

    def self.valid_moves(pos)
        # debugger if pos[0]==4 && pos[1]==2
        vectors = [
                [ 2, 1],
                [ 2,-1],
                [-2, 1],
                [-2,-1],
                [ 1, 2],
                [ 1,-2],
                [-1, 2],
                [-1,-2],
                    ]
        vectors.map!{|v| [pos[0]+v[0],pos[1]+v[1]]}
        # debugger
        vectors.select! do |pos|
            pos[0] < 8 && pos[0] >= 0 && pos[1] < 8 && pos[1] >= 0
        end # select! will delete something in place...
        vectors
    end
    attr_reader :root_node
    def initialize(pos)
        @root_node = PolyTreeNode.new(pos) # all Nodes hold value = {X,Y} = pos[0],pos[1]
        @considered_moves = Array.new(8) {Array.new(8,false)}
        @considered_moves[pos[0]][pos[1]] = true
        self.build_move_tree
    end

    def build_move_tree
        # potential moes from me => children
            # these children are new_move_positions
        # me.children << new_moves
            #iterate through my children, repeat
            # BASE: if there are no more new_moves
        # Breadth-first: Q
        q = []
        q.push(@root_node)
        while !q.empty?
            current_node = q.shift()
            new_moves = new_move_positions(current_node.value)
            new_moves.each do |move|
                new_child = PolyTreeNode.new(move)
                current_node.add_child(new_child) # turning a move into a node
                q.push(new_child) # queueing to keep adding for bfs
            end
        end

    end

    def new_move_positions(pos)
        valid_moves = KnightPathFinder.valid_moves(pos)
        debugger unless valid_moves
        valid_moves.reject! {|move| @considered_moves[move[0]][move[1]] }
        valid_moves.each {|move| @considered_moves[move[0]][move[1]] = true}
    end

    # def inspect
    #     @root_node.inspect
    # end

end

if __FILE__ == $PROGRAM_NAME
    # p KnightPathFinder.valid_moves([0,0])
    # p KnightPathFinder.valid_moves([3,0])
    # p KnightPathFinder.valid_moves([0,4])
    # p KnightPathFinder.valid_moves([1,1])
    # p "Start new testing"
    # p KnightPathFinder.valid_moves([4,2])
    # p KnightPathFinder.valid_moves([4,1])
    # p KnightPathFinder.valid_moves([5,2])
    # p KnightPathFinder.valid_moves([5,1])
    # p KnightPathFinder.valid_moves([3,2])
    # p KnightPathFinder.valid_moves([3,1])
    # p "start more testing"
    # p KnightPathFinder.valid_moves([7,2])
    # p KnightPathFinder.valid_moves([6,2])
    # p KnightPathFinder.valid_moves([5,2]) # => nil?
    # p KnightPathFinder.valid_moves([4,2]) # => nil?
    # p KnightPathFinder.valid_moves([3,2]) # => nil?
    # p KnightPathFinder.valid_moves([2,2]) # => nil?
    # p KnightPathFinder.valid_moves([1,2])
    # p KnightPathFinder.valid_moves([0,2])
    k = KnightPathFinder.new([7,6])
    p k
    # k.root_node.print
    # p k
    # k.inspect

    
end
