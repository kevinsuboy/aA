require "board"

describe "board" do
  let(:board) { Board.new() }
  describe "V1" do
    describe "#initialize" do
    # A Board instance must have an instance variable to represent the game grid. For now, Board#initialize does not need to accept any arguments. Initialize the grid so that all positions are empty; this means that every position should contain an underscore ('_').
      it "requires no args" do
        board
      end
      it "should initialize grid" do
        expect(board.instance_variable_get(:@grid)).to eq([["_", "_", "_"], ["_", "_", "_"], ["_", "_", "_"]])
      end
    end
    describe "#valid?" do
      # This method should return a boolean indicating whether or not the specified position is valid for the board, meaning the position is not "out of bounds."
      expect(board.valid?([1,1])).to eq(true)
      expect(board.valid?([1,2])).to eq(true)
      expect(board.valid?([3,3])).to eq(false)

    end
    describe "#empty?" do
      # This method should return a boolean indicating whether or not the specified position does not contain a player's mark.

    end
    describe "#place_mark" do
      # This method should assign the given mark to the specified position of the grid. It should raise an error when the position is not #valid? or not #empty?.

    end
    describe "#print" do
    # This method should simply print out the board and all of the marks that have been placed on it. Feel free to style the printing as much as you'd like, but be sure to print out each row of the board on a new line. This will help us visualize the board better as we debug or even play the game!

    end
    describe "#win_row?" do
      # This method should return a boolean indicating whether or not the given mark has completely filled up any row of the grid.

    end
    describe "#win_col?" do
      # This method should return a boolean indicating whether or not the given mark has completely filled up any column of the grid.

    end
    describe "#win_diagonal?" do
      # This method should return a boolean indicating whether or not the given mark has completely filled up either diagonal of the grid.

    end
    describe "#win?" do
      # This method should return a boolean indicating whether or not the given mark has filled any full row, column, or diagonal.

    end
    describe "#empty_positions?" do
      # This method should return a boolean indicating whether or not there is at least one empty position on the grid.

    end
  end
end
