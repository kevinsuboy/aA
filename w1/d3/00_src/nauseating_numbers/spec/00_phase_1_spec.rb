require "nauseating_numbers"

# Write a method strange_sums that accepts an array of 
# numbers as an argument
# The method should return a count of the
# number of distinct pairs of elements that have a sum of zero
# You may assume that the input array contains unique elements.


# it "should not use the built-in Array#partition" do
#   arr = [11, 5, 13, 2, 3]
#   expect(arr).to_not receive(:partition)
#   strange_sums(arr)
# end
describe "Nauseating numbers" do
  describe "strange_sums" do
    it "should accept an array" do
      expect { strange_sums([11, 5, 13, 2, 3]) }.to_not raise_error
    end

    it "should return a count of the number of distinct pairs of elements that have a sum of zero" do
      expect(strange_sums([2, -3, 3, 4, -2])).to eq(2)
      expect(strange_sums([42, 3, -1, -42]) ).to eq(1)
      expect(strange_sums([-5, 5])          ).to eq(1)
      expect(strange_sums([19, 6, -3, -20]) ).to eq(0)
      expect(strange_sums([9])              ).to eq(0)
    end
  end
  # Write a method pair_product that accepts an array of numbers
  # and a product as arguments.
  # The method should return a boolean indicating
  # whether or not a pair of distinct elements in the array result in the
  # product when multiplied together
  # You may assume that the input array contains unique elements.
  describe "pair_product" do
    it "should accept an array of numbers and a product" do
      expect { pair_product([11, 5, 13, 2, 3], 18) }.to_not raise_error
    end

    it "should return a boolean indicating whether a pair of distinct elemtns result in product" do
      expect( pair_product([4, 2, 5, 8], 16)).to eq(    true)
      expect( pair_product([8, 1, 9, 3], 8)).to eq(     true)
      expect( pair_product([3, 4], 12)).to eq(          true)
      expect( pair_product([3, 4, 6, 2, 5], 12)).to eq( true)
      expect( pair_product([4, 2, 5, 7], 16)).to eq(    false)
      expect( pair_product([8, 4, 9, 3], 8)).to eq(     false)
      expect( pair_product([3], 12)).to eq(             false)
    end
  end
 # Write a method rampant_repeats that accepts a string and a hash as arguments
 # The method should return a new string where
 # characters of the original string are repeated the
 # number of times specified by the hash
 # If a character does not exist as a key of the hash
 # then it should remain unchanged.
  describe "rampant_repeats" do
    it "should accept a string and a hash" do
      expect { rampant_repeats('taco', {'a'=>3, 'c'=>2})}.to_not raise_error
    end

    it "should return a new string where chars of orig str are rep # times spec'd by hash, else unchange" do
      expect(rampant_repeats('taco', {'a'=>3, 'c'=>2})             ).to eq( 'taaacco'         )
      expect(rampant_repeats('feverish', {'e'=>2, 'f'=>4, 's'=>3}) ).to eq( 'ffffeeveerisssh')
      expect(rampant_repeats('misispi', {'s'=>2, 'p'=>2})          ).to eq( 'mississppi')
      expect(rampant_repeats('faarm', {'e'=>3, 'a'=>2})            ).to eq( 'faaaarm')
    end
  end
# Write a method perfect_square? that accepts a number as an argument
# The method should return a boolean indicating 
# whether or not the argument is a perfect square
# A perfect square is a number that is the product of some number multiplied by itself
# For example, since 64 = 8 * 8 and 144 = 12 * 12, 64 and 144 are perfect squares; 35 is not a perfect square.
  describe "perfect_square?" do
    it "should accept a num" do
      expect { perfect_square?(1)     }.to_not raise_error
    end

    it "return bool, whether its a perfect square" do
      expect( perfect_square?(1)     ).to eq(true)
      expect( perfect_square?(4)     ).to eq(true)
      expect( perfect_square?(64)    ).to eq(true)
      expect( perfect_square?(100)   ).to eq(true)
      expect( perfect_square?(169)   ).to eq(true)
      expect( perfect_square?(2)     ).to eq(false)
      expect( perfect_square?(40)    ).to eq(false)
      expect( perfect_square?(32)    ).to eq(false)
      expect( perfect_square?(50)    ).to eq(false)
    end
  end

end
