require 'byebug'
class Array
  # Write an `Array#my_inject` method. If my_inject receives no argument, then
  # use the first element of the array as the default accumulator.
  # **Do NOT use the built-in `Array#inject` or `Array#reduce` methods in your 
  # implementation.**

  def my_inject(accumulator = nil, &prc)
    # debugger
      accumulator = self.shift unless accumulator
    # debugger
    self.each {|el| accumulator = prc.call(accumulator,el)}
    accumulator
  end
end

# Define a method `primes(num)` that returns an array of the first "num" primes.
# You may wish to use an `is_prime?` helper method.

def is_prime?(num)
  # debugger
  (2..num/2).each do |n|
    return false if num%n == 0
  end
  return true
end

def primes(num)
  res = []
  n = 2
  while num > 0
    if is_prime?(n)
      res << n
      num -= 1
    end
    n += 1
  end
  res
end

# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)
  return [1] if num<=1
  prev = factorials_rec(num-1)
  prev.concat([(num-1)*prev[-1]])
end

class Array
  # Write an `Array#dups` method that will return a hash containing the indices 
  # of all duplicate elements. The keys are the duplicate elements; the values 
  # are arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    hash = Hash.new{|h,k| h[k] = []}
    self.each_with_index {|el,i| hash[el]<<i}
    hash.each {|k,v| hash.delete(k) if v.length < 2}
    hash
  end
end

class String
  # Write a `String#symmetric_substrings` method that returns an array of 
  # substrings that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.

  def symmetric_substrings
    width = 1
    i = 0
    j = 1
    res = []
    while width < self.length
      while j< self.length
        res << self[i..j] if self[i..j].is_Palindrome?
        i +=1
        j += 1
      end
      i = 0
      width += 1
      j = i + width
    end
    res
  end
  # private
  def is_Palindrome?
    m = (self.length-1)/2
    rm = m+1
    m -= 1 if (self.length)%2 != 0
    while m>=0
      return false if self[m] != self[rm]
      m -= 1
      rm += 1
    end
    return true
  end
end

class Array
  # Write an `Array#merge_sort` method; it should not modify the original array.
  # **Do NOT use the built in `Array#sort` or `Array#sort_by` methods in your 
  # implementation.**
  
  def merge_sort(&prc)
    return self if self.length <= 1
    prc ||= Proc.new{|l,r| l<r}
    m = (self.length-1)/2
    left = self[0..m].merge_sort(&prc)
    right = self[m+1..-1].merge_sort(&prc)
    Array.merge(left,right,&prc)
  end

  private
  def self.merge(left, right, &prc)
    i = 0
    j = 0
    res = []
    while i<left.length && j<right.length
      pp = prc.call(left[i],right[j]) 
      pp = pp.is_a?(Integer) ? pp < 0 : pp
      if pp
        res.concat([left[i]])
        i += 1
      else
        res.concat([right[j]])
        j += 1
      end
    end
    while i<left.length
        res.concat([left[i]])
        i += 1
    end
    while j<right.length
        res.concat([right[j]])
        j += 1
    end
    res
  end
end
