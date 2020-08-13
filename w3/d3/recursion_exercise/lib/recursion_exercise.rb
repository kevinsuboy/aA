require 'byebug'

# Warmup

# Write a recursive method, range, that takes a start and an end and returns an array of all numbers in that range, exclusive. For example, range(1, 5) should return [1, 2, 3, 4]. If end < start, you can return an empty array.

def range(start,stop)
    return [] if start >= stop
    [start] + range(start+1,stop)
end

# p range(1,9)  # => [1...9]
# p range(2,10) # => [2...10]
# p range(5,14) # => [5...14]
# p range(4,13) # => []
# p range(7,46) # => []
# p range(5,5) # => []

# Write both a recursive and iterative version of sum of an array.
def sum_of_array_rec(arr)
    return arr[0] if arr.length == 1
    arr[0] + sum_of_array_rec(arr[1..-1])
end

def sum_of_array_it(arr)
    sum = 0
    arr.each do |el|
        sum += el
    end
    sum
end
# p sum_of_array_it([1,2,3,4,5,6,7])
# p sum_of_array_it([3,4,5,6,7])
# p sum_of_array_it([1,2,3,4,5])
# p sum_of_array_it([4,8,2,8,0,5,6,7])
# p sum_of_array_it([4,7,9,8,3])

# Exercises

def exp(b,n)
    return 1 if n==0
    return b if n==1
    if n.even?
        res = exp(b,n/2)
        return res*res # (b^(n/2))^2
    end
    res = exp(b,(n-1)/2)
    return b*res*res # b*(b^((n-1)/2))^2
end
# # this is math, not Ruby methods.
# # recursion 1
# exp(b, 0) = 1
# exp(b, n) = b * exp(b, n - 1)

# # recursion 2
# exp(b, 0) = 1
# exp(b, 1) = b
# exp(b, n) = exp(b, n / 2) ** 2             [for even n]
# exp(b, n) = b * (exp(b, (n - 1) / 2) ** 2) [for odd n]
# p exp(2,2) # => 4
# p exp(3,5) # => 4
# p exp(4,8) # => 4
# p exp(5,3) # => 4
# p exp(6,7) # => 4
# p exp(7,1) # => 4
# p exp(8,0) # => 4

class Array
    
    def deep_dup
        self.map do |el|
            if el.is_a?(Array)
                el.deep_dup # el="hello" <str> ... <str>.deep_dup... <str> doesn't have a deep_dup >>ERROR
            else
                el # <str> <integer>... "imm"
            end
        end # map creates a new ID, each of the el needs deep copies as well
    end
end
# robot_parts = [
#     ["nuts", "bolts", "washers"],
#     ["capacitors", "resistors", "inductors"]
# ]

# robot_parts_copy = robot_parts.dup # SHALLOW COPY
# robot_parts_copy[1] << "LEDs"
# p robot_parts
# p robot_parts_copy
# p robot_parts[1]
# p robot_parts_copy[1]
# p "DEEP cases"
# robot_parts_copy = robot_parts.deep_dup # DEEP COPY
# robot_parts_copy[1] << "LEDs"
# p robot_parts
# p robot_parts_copy
# p robot_parts[1]
# p robot_parts_copy[1]


def fibonacci_rec(n)
    return [1] if n == 1
    return [1, 1] if n == 2
    f_n_1 = fibonacci_rec(n-1)
    f_n_1.concat([f_n_1[-2]+f_n_1[-1]])
end

def fibonacci_ite(n)
    return [1] if n == 1
    return [1, 1] if n == 2
    arr = [1,1]
    (3..n).each do |i|
        arr.concat([arr[-2]+arr[-1]])
    end
    arr
end

# p fibonacci_ite(1) == fibonacci_rec(1)  
# p fibonacci_ite(2) == fibonacci_rec(2)  
# p fibonacci_ite(3) == fibonacci_rec(3)  
# p fibonacci_ite(4) == fibonacci_rec(4)  
# p fibonacci_ite(5) == fibonacci_rec(5)  
# p fibonacci_ite(6) == fibonacci_rec(6)  
# p fibonacci_ite(60) == fibonacci_rec(60)  




def bsearch(arr, target)
    # RECURSIVE
    return bsearch_helper(arr,0,arr.length-1,target)
    # l = 0
    # r = arr.length-1
    # while l < r
    #     m = (r-l)/2+l
    #     if arr[m] < target # right side
    #         l = m+1
    #     else    # left side
    #         r = m
    #     end
    # end
    # return nil if arr[l] != target # l == r
    # l
end

def bsearch_helper(arr,l,r,target)
    if l==r
        return nil if arr[l] != target # l == r
        return l
    end
    m = (r-l)/2+l
    if arr[m]<target
        l = m+1
    else
        r = m
    end
    bsearch_helper(arr,l,r,target)
end

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

class Array
    def merge_sort
        return self if self.length<=1 # array is 0 or 1 in length
        m = (self.length-1)/2
        l_arr = self[0..m].merge_sort # left half
        r_arr = self[m+1..-1].merge_sort # right half
        merge(l_arr, r_arr)
    end
    def merge(l_arr,r_arr)
        res = []
        i = 0
        j = 0
        while i<l_arr.length && j<r_arr.length
            if l_arr[i] < r_arr[j]
                res << l_arr[i]
                i += 1
            else
                res << r_arr[j]
                j += 1
            end
        end
        while i<l_arr.length # put the rest of left into res
            res << l_arr[i]
            i += 1
        end
        while j<r_arr.length # put the rest of right into res
            res << r_arr[j]
            j += 1
        end
        res
    end
end

# p [89,12,5,43,123,67,123,67,32,76].merge_sort
# p [38,27,43,3,9,82,10].merge_sort

def subsets(arr)
    return [] if arr.empty?
    return [[],arr] if arr.length == 1
   
end

# def permutation(arr)

# end

