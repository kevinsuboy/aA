require 'byebug'
class Array
  # Write an `Array#my_inject` method. If my_inject receives no argument, then
  # use the first element of the array as the default accumulator.
  # **Do NOT use the built-in `Array#inject` or `Array#reduce` methods in your 
  # implementation.**

  def my_inject(accumulator = nil, &prc)
    # debugger if !accumulator
    accumulator ||= self.shift
    self.each {|el| accumulator = prc.call(accumulator,el)}
    accumulator
  end
end

# Define a method `primes(num)` that returns an array of the first "num" primes.
# You may wish to use an `is_prime?` helper method.

def is_prime?(num)
  (2..num/2).each {|n| return false if num % n == 0}
  return true
end

def primes(num)
  res = []
  val = 2
  while num > 0
    if is_prime?(val)
      res << val
      num -= 1
    end
    val += 1
  end
  res
end

# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)
  return [1] if num <= 1
  res = factorials_rec(num-1)
  res.concat([(num-1)*res[-1]])
end

class Array
  # Write an `Array#dups` method that will return a hash containing the indices 
  # of all duplicate elements. The keys are the duplicate elements; the values 
  # are arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    hash = Hash.new{|h,k| h[k] = []}
    self.each_with_index {|el,i| hash[el]<<i}
    hash.keys.each {|k| hash.delete(k) if hash[k].length<2}
    hash
  end
end

class String
  # Write a `String#symmetric_substrings` method that returns an array of 
  # substrings that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.
  def symmetric_substrings
    res = []
    self.length.times do |l|
      (1...(self.length-l)).each do |r|
        res << self[l..l+r] if self[l..l+r]==self[l..l+r].reverse
      end
    end
    res
  end
end

class Array
  # Write an `Array#merge_sort` method; it should not modify the original array.
  # **Do NOT use the built in `Array#sort` or `Array#sort_by` methods in your 
  # implementation.**
  
  def merge_sort(&prc)
    return self if self.length <= 1
    prc ||= Proc.new{|l,r| l<=>r}
    m = (self.length-1)/2
    left,right = self[0..m].merge_sort(&prc), self[m+1..-1].merge_sort(&prc)
    Array.merge(left,right,&prc)
  end

  private
  def self.merge(left, right, &prc)
    res = []
    while (!left.empty?) && (!right.empty?)
      case prc.call(left.first, right.first)
      when -1
        res << left.shift
      when 0
        res << left.shift
      when 1
        res << right.shift
      end
    end
    res + left + right
  end
end
