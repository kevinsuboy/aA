require "nauseating_numbers"

describe "NN_p2" do
# Write a method anti_prime? that accepts a number as an argument.
# The method should return true if the given number has more divisors
# than all positive numbers less than the given number
# For example, 24 is an anti-prime because it has more divisors
# than any positive number less than 24
# Math Fact: Numbers that meet this criteria are also known as
# highly composite numbers
describe "anti_prime?" do
    it "should accept a number" do
      expect { anti_prime?(24) }.to_not raise_error
    end

    it "should return true if N has more divisors than all +ve # < N" do
      expect(anti_prime?(24)   ).to eq(true)
      expect(anti_prime?(36)   ).to eq(true)
      expect(anti_prime?(48)   ).to eq(true)
      expect(anti_prime?(360)  ).to eq(true)
      expect(anti_prime?(1260) ).to eq(true)
      expect(anti_prime?(27)   ).to eq(false)
      expect(anti_prime?(5)    ).to eq(false)
      expect(anti_prime?(100)  ).to eq(false)
      expect(anti_prime?(136)  ).to eq(false)
      expect(anti_prime?(1024) ).to eq(false)
    end
  end
  # Let a 2-dimensional array be known as a "matrix".
  # Write a method matrix_addition that accepts two matrices as arguments
  # The two matrices are guaranteed to have the same "height" and "width"
  # The method should return a new matrix representing the sum of the two arguments
  # To add matrices, we simply add the values at the same positions:
  describe "matrix_addition" do
      it "should accept 2 matrices" do
        matrix_a = [[2,5], [4,7]]
        matrix_b = [[9,1], [3,0]]
        expect { matrix_addition(matrix_a, matrix_b)}.to_not raise_error
      end

      it "should return sum of matrix eles" do
        matrix_a = [[2,5], [4,7]]
        matrix_b = [[9,1], [3,0]]
        matrix_c = [[-1,0], [0,-1]]
        matrix_d = [[2, -5], [7, 10], [0, 1]]
        matrix_e = [[0 , 0], [12, 4], [6,  3]]

        expect(matrix_addition(matrix_a, matrix_b)).to eq([[11, 6], [7, 7]])
        expect(matrix_addition(matrix_a, matrix_c)).to eq([[1, 5], [4, 6]])
        expect(matrix_addition(matrix_b, matrix_c)).to eq([[8, 1], [3, -1]])
        expect(matrix_addition(matrix_d, matrix_e)).to eq([[2, -5], [19, 14], [6, 4]])
      end
    end
    # Write a method mutual_factors that accepts any amount of numbers as arguments
    # The method should return an array containing all of the common divisors shared among the arguments.
    # For example, the common divisors of 50 and 30 are 1, 2, 5, 10. You can assume that all of the arguments are positive integers.
  describe "mutual_factors" do
      it "should accept 2 matrices" do
        expect { mutual_factors(50, 30)            }.to_not raise_error
      end

      it "should return sum of matrix eles" do
        expect(mutual_factors(50, 30)            ).to eq([1, 2, 5, 10])
        expect(mutual_factors(50, 30, 45, 105)   ).to eq([1, 5])
        expect(mutual_factors(8, 4)              ).to eq([1, 2, 4])
        expect(mutual_factors(8, 4, 10)          ).to eq([1, 2])
        expect(mutual_factors(12, 24)            ).to eq([1, 2, 3, 4, 6, 12])
        expect(mutual_factors(12, 24, 64)        ).to eq([1, 2, 4])
        expect(mutual_factors(22, 44)            ).to eq([1, 2, 11, 22])
        expect(mutual_factors(22, 44, 11)        ).to eq([1, 11])
        expect(mutual_factors(7)                 ).to eq([1, 7])
        expect(mutual_factors(7, 9)              ).to eq([1])
      end
    end
    # The tribonacci sequence is similar to that of Fibonacci.
    # The first three numbers of the tribonacci sequence are 1, 1, and 2.
    # To generate the next number of the sequence, we take the sum of the previous three numbers.
    # The first six numbers of tribonacci sequence are:
    # Write a method tribonacci_number that accepts a number argument, n,
    # and returns the n-th number of the tribonacci sequence.
  describe "mutual_factors" do
      it "should idx of trib sequence" do
        expect { tribonacci_number(1) }.to_not raise_error
      end

      it "should value at trib seque idx" do
        expect(tribonacci_number(1) ).to eq( 1)
        expect(tribonacci_number(2) ).to eq( 1)
        expect(tribonacci_number(3) ).to eq( 2)
        expect(tribonacci_number(4) ).to eq( 4)
        expect(tribonacci_number(5) ).to eq( 7)
        expect(tribonacci_number(6) ).to eq( 13)
        expect(tribonacci_number(7) ).to eq( 24)
        expect(tribonacci_number(11)).to eq( 274)
      end
    end
end
