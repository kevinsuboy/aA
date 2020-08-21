require "byebug"

class Array
    def my_uniq
        return self if self.length < 1
        s = Set.new
        self.each do |sub_arr|
            s.add(sub_arr)
        end
        s.to_a
    end

    def two_sum
        return self if self.empty?
        res = []
        self.each_with_index do |el,i|
            (i+1..self.length-1).each do |j|
                if el + self[j] == 0
                    pairs = [i,j]
                    res << pairs
                end
            end
        end
        res
    end
end

def my_transpose(arr)
    raise "invalid" unless arr.all?{|sub_arr| sub_arr.is_a?(Array) && sub_arr.length == arr.length}
    result = Array.new(arr.length){Array.new(arr.length)}
    (0...arr.length).each do |i|
        (0...arr.length).each do |j|
            # debugger
            result[j][i] = arr[i][j] 
        end
    end
    result
end

def stock_picker(arr)
    raise "not an array" unless arr.is_a?(Array)
    max_profit = 0
    res = []
    (0...arr.length).each do |i|
        (i+1...arr.length).each do |j|
            if arr[j] - arr[i] > max_profit
                max_profit = arr[j] - arr[i]
                res = [i,j]
            end
        end
    end
    res
end

class Hanoi
    # @board = [[2,1], [3] []]
    attr_reader :board
    def initialize(start_board)
        @board = start_board
    end
    def valid_move?(src,dest)
        return false if @board[src].empty?
        return true if @board[dest].empty?
        @board[src][-1] < @board[dest][-1]
        # top of src smaller than top of dest
    end
    def play()
        # "0 1".split.to_i
        # x = [0,1]
        # valid_move?(x[0],x[1])
        until game_over?
            print self.board
            puts "please enter your move"
            input = gets.chomp.split.map{|el|el.to_i}
            self.move(input[0],input[1])
        end
        puts "You win!"
    end
    
    def move(src,dest)
        # debugger
        if valid_move?(src,dest)
            self.board[dest] << self.board[src].pop
        end
    end
    def game_over?
        self.board.any?{|stack| stack == [3,2,1]}
    end
end

