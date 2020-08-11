# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple
# of both of the given numbers
require 'byebug'
def least_common_multiple(num_1, num_2)
    i = num_1
    while !(i%num_1==0 && i%num_2==0)
        i += 1
    end
    i
end


# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)
    hash = Hash.new(0)
    (0...str.length-1).each do |i|
        pair = str[i..i+1]
        hash[pair] += 1
    end
    max_v = 0
    max_k = ""
    hash.each do |k,v|
        if v>max_v
            max_v = v
            max_k = k
        end
    end
    max_k
end


class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse
        hash = Hash.new
        self.each {|k,v| hash[v] = k}
        hash
    end
end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
    def pair_sum_count(num)
        # loop within a loop, O(n^2)
        # hash would be O(n) n = 10 n^2 = 100 
        hash = Hash.new(0)
        count = 0
        self.each do |i| # n items
            # debugger
            if hash.has_key?(num - i) # O(1) time
                count += hash[num - i] #O(1)
            end
            hash[i] += 1 #O(1)
        end
        count
    end

    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    #
    # Sorting algorithms like bubble_sort, commonly accept a block. That block accepts
    # two parameters, which represents the two elements in the array being compared.
    # If the block returns 1, it means that the second element passed to the block
    # should go before the first (i.e. switch the elements). If the block returns -1,
    # it means the first element passed to the block should go before the second
    # (i.e. do not switch them). If the block returns 0 it implies that
    # it does not matter which element goes first (i.e. do nothing).
    #
    # This should remind you of the spaceship operator! Convenient :)
    def bubble_sort(&prc)
        prc ||= Proc.new{|l,r| l <=> r}
        flag = true
        while(flag)
            flag = false
            (0...self.length-1).each do |i|
                # res = prc.call(i,i+1)
                res = prc.call(self[i],self[i+1])
                if res==1
                    self[i],self[i+1] = self[i+1],self[i]
                    flag = true
                end
            end
        end
        self
    end
end
