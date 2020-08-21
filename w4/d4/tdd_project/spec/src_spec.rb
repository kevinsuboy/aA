require "rspec"
require 'src'

describe "Array#my_uniq" do
    it "should handle all types of arrays" do
        # [] should not raise error
        expect{[].my_uniq}.to_not raise_error
        # int should not raise error
        expect{[1,3,5,2].my_uniq}.to_not raise_error
        # str should not raise error
        expect{[1,3,5,2].my_uniq}.to_not raise_error
        # X-D should not raise error
        expect{[1,3,[1,3],[1,2,[5,4,3]]].my_uniq}.to_not raise_error
        # mixed should not raise error
        expect{[1,"a",[1,2],[1,"a",[1,2,3]]].my_uniq}.to_not raise_error
    end
    it "should handle empty array" do
        expect([].my_uniq).to eq([]) 
    end
    it "should handle Integer array" do
        expect([1,1,2,2,3,3].my_uniq).to eq([1,2,3])
    end
    it "should handle String array" do
        expect(["1","1","2","2","3","3"].my_uniq).to eq(["1","2","3"])
    end
    it "should handle 2D arrays" do
        expect([[1,2],[1,2]].my_uniq).to eq([[1,2]])
    end
    it "should handle multi-D arrays" do
        expect([[1, 2, [3, 4]],[1, 2, [3, 4]]].my_uniq).to eq([[1, 2, [3, 4]]])
    end
    it "should not use Array#uniq" do
        arr = [1,2,3] 
        expect(arr).to_not receive(:uniq)
        arr.my_uniq
    end
end

describe "Array#two_sum" do 
    context "when Array is empty" do
        arr = []
        it "should not raise error" do 
            expect{arr.two_sum}.to_not raise_error
        end

        it "should return empty array" do 
            expect(arr.two_sum).to eq([])
        end
    end

    context "when Array does not contain sums" do
        it "should return empty array" do 
            expect([1, 1, 3].two_sum).to eq([])
            expect([-1,-1,-3,-3,-8].two_sum).to eq([])
            expect([-4,-8,1,3,7,-5].two_sum).to eq([])
        end
    end

    context "when Array does contain sums" do
        it "should return an array of index pairs" do
            expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
        end
    end
end

describe "#my_transpose" do
    it "should take in a 2d array as an argument" do
        expect{my_transpose([[0,1],[2,3]])}.to_not raise_error
        expect{my_transpose([1,2,3])}.to raise_error
    end
    it "should have equal subarray lengths" do
        # let(:arr){Array.new(4){Array.new(4)}}
        expect{my_transpose([[0,1],[2,3],[3]])}.to raise_error
    end
    it "should convert rows to columns" do 
        expect(my_transpose([[0,1],[2,3]])).to eq([[0,2],[1,3]])
    end
end

describe "#stock_picker" do
    subject(:prices){[3,4,5,4,10,1,2]}
    it "should take in an array" do
        expect{stock_picker()}.to raise_error(ArgumentError)
        expect{stock_picker(1)}.to raise_error
        expect{stock_picker("a")}.to raise_error
        expect{stock_picker([])}.to_not raise_error
    end

    context "when profitable pairs exist" do 
        it "should return a index pair" do
            expect(stock_picker(prices)).to be_a(Array)
            expect(stock_picker(prices).length).to eq(2)
            expect(stock_picker(prices)).to eq([0,4])
        end
    end
    

    context "when no profitable pairs" do
        it "should return an empty array" do
            expect(stock_picker([3, 2, 1]).length).to eq(0)
        end
    end
end

describe Hanoi do
    # subject(:hanoi) {Hanoi.new}
    subject(:game){Hanoi.new([[2,1],[3],[]])}

    describe "#initialize" do 
        it "should create @board array" do 
            expect(game.board).to be_a(Array)
        end
        
        it "@board should have 3 subarrays" do 
            expect(game.board.length).to eq(3)
        end

        it "should initialize board to given value" do
            expect(game.board).to eq([[2,1],[3],[]])
        end
    end

    
    describe "#valid_move?" do
        context "when it is a valid move" do
            it "should return true" do 
                expect(game.valid_move?(0,1)).to be true
                expect(game.valid_move?(1,2)).to be true
                expect(game.valid_move?(0,2)).to be true
            end
        end
        
        context "when it is not a valid move" do
            it "should return false" do
                expect(game.valid_move?(1,0)).to be false
                expect(game.valid_move?(2,0)).to be false 
            end
        end
    end

    describe "#move" do 
        context "if it is a valid move" do
            it "should remove from the top of one stack and put it on another" do
                game.move(0,1)
                expect(game.board).to eq([[2], [3,1], []])
                game.move(0,2)
                expect(game.board).to eq([[], [3,1], [2]])
            end
        end
    end
    describe "#game_over?" do
        it "should return true when game is over" do
            # allow(game.board).to receive([[3,2,1],[],[]])
            game.instance_variable_set("@board",[[3,2,1],[],[]])
            expect(game.game_over?).to be true
        end
        it "should return false when game is not over" do
            expect(game.game_over?).to be false
        end
    end
    describe "#play" do
        context "when game is over" do
            it "should print you win" do 
                game.instance_variable_set("@board",[[3,2,1],[],[]])
                expect{game.play}.to output("You win!\n").to_stdout
                # game.play
                # STDOUT.should_receive(:puts).with('You Win?') 
            end
        end
    end
end


# RSpec.describe ClassyClass do
#   let(:stacey_instance) { described_class.new }
#   describe '#exists?' do
#     it 'outputs a confirmation that it exists' do
#       expect { stacey_instance.exists? }.to output("Yes\n").to_stdout
#     end
#   end
# end