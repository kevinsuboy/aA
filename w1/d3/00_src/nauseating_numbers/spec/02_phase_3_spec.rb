require "nauseating_numbers"

describe "NN_p3" do
  # Write a method matrix_addition_reloaded that accepts any number of matrices as arguments
  # The method should return a new matrix representing the sum of the arguments
  # Matrix addition can only be performed on matrices of similar dimensions, so if all of the given matrices do not have the same "height" and "width", then return nil.
  
  describe "matrix_addition_reloaded?" do
    it "should accept any # of matrices" do
      matrix_a = [[2,5], [4,7]]
      matrix_b = [[9,1], [3,0]]
      expect { matrix_addition_reloaded(matrix_a, matrix_b) }.to_not raise_error
    end

    it "should return new mat, sum of args only on same dims" do
      matrix_a = [[2,5], [4,7]]
      matrix_b = [[9,1], [3,0]]
      matrix_c = [[-1,0], [0,-1]]
      matrix_d = [[2, -5], [7, 10], [0, 1]]
      matrix_e = [[0 , 0], [12, 4], [6,  3]]

      expect(matrix_addition_reloaded(matrix_a, matrix_b)              ).to eq([[11, 6], [7, 7]])
      expect(matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    ).to eq([[10, 6], [7, 6]])
      expect(matrix_addition_reloaded(matrix_e)                        ).to eq([[0, 0], [12, 4], [6, 3]])
      expect(matrix_addition_reloaded(matrix_d, matrix_e)              ).to eq([[2, -5], [19, 14], [6, 4]])
      expect(matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    ).to eq(nil)
      expect(matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    ).to eq(nil)
    end
  end
  # Write a method squarocol? that
  # accepts a 2-dimensional array as an argument
  # The method should return a boolean indicating
  # whether or not any row or column is completely filled with
  # the same element
  # You may assume that the 2-dimensional array has "square" dimensions,
  # meaning it's height is the same as it's width.
  describe "squarocol?" do
    it "should accept 2D array" do
      matrix_a = [
        [:a, :x , :d],
        [:b, :x , :e],
        [:c, :x , :f]
      ]
      expect { squarocol?(matrix_a) }.to_not raise_error
    end

    it "should return bool, whether any ele same" do
    expect(squarocol?([
        [:a, :x , :d],
        [:b, :x , :e],
        [:c, :x , :f]
    ])).to eq(true
    )
    expect(squarocol?([
        [:x, :y, :x],
        [:x, :z, :x],
        [:o, :o, :o]
    ])).to eq(true
    )
    expect(squarocol?([
        [:o, :x , :o],
        [:x, :o , :x],
        [:o, :x , :o]
    ])).to eq(false)

    expect(squarocol?([
        [1, 2, 2, 7],
        [1, 6, 6, 7],
        [0, 5, 2, 7],
        [4, 2, 9, 7]
    ])).to eq(true
    )
    expect(squarocol?([
        [1, 2, 2, 7],
        [1, 6, 6, 0],
        [0, 5, 2, 7],
        [4, 2, 9, 7]
    ])).to eq(false)
    end
  end
  describe "squaragonal?" do
    # Write a method squaragonal? that accepts 2-dimensional array
    # as an argument 
    # The method should return a boolean indicating
    # whether or not the array contains all of the same element
    # across either of its diagonals
    # You may assume that the 2-dimensional array
    # has "square" dimensions,
    # meaning it's height is the same as it's width
    it "should accept a square matrix" do
      expect { squaragonal?([
          [:x, :y, :o],
          [:x, :x, :x],
          [:o, :o, :x]
      ]) }.to_not raise_error
    end

    it "should return new mat, sum of args only on same dims" do
expect( squaragonal?([
    [:x, :y, :o],
    [:x, :x, :x],
    [:o, :o, :x]
])).to eq( true)

expect( squaragonal?([
    [:x, :y, :o],
    [:x, :o, :x],
    [:o, :o, :x]
])).to eq( true)

expect( squaragonal?([
    [1, 2, 2, 7],
    [1, 1, 6, 7],
    [0, 5, 1, 7],
    [4, 2, 9, 1]
])).to eq( true)

expect( squaragonal?([
    [1, 2, 2, 5],
    [1, 6, 5, 0],
    [0, 2, 2, 7],
    [5, 2, 9, 7]
])).to eq( false)
    end
  end
# Pascal's triangle is a 2-dimensional array
# with the shape of a pyramid
# The top of the pyramid is the number 1
# To generate further levels of the pyramid,
# every element is the sum of the element above and to the left
# with the element above and to the right.
# Nonexisting elements are treated as 0 when calculating the sum
# For example, here are the first 5 levels of Pascal's triangle:
  describe "pascals_triangle?" do
    it "should accept a +ve num" do
    expect { pascals_triangle(5) }.to_not raise_error
    end

    it "should return triangle" do
    expect( pascals_triangle(5)).to eq(
    [
        [1],
        [1, 1],
        [1, 2, 1],
        [1, 3, 3, 1],
        [1, 4, 6, 4, 1]
    ]
    )

    expect( pascals_triangle(7)).to eq(
    [
        [1],
        [1, 1],
        [1, 2, 1],
        [1, 3, 3, 1],
        [1, 4, 6, 4, 1],
        [1, 5, 10, 10, 5, 1],
        [1, 6, 15, 20, 15, 6, 1]
    ]
    )
    end
  end



end
