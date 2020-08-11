# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.
require "byebug"
def largest_prime_factor(num)
# return largest factor that is a prime num
    (2..num/2).reverse_each do |n|
        if num % n == 0 && is_prime?(n)
            return n
        end
    end
    return num
end

def is_prime?(num)
    return false if num < 2
    (2...num).each do |n|
        if num % n == 0
            return false
        end
    end
    true
end

def unique_chars?(str)
    hash = Hash.new(0)
    # hello
    str.each_char do |char|
        return false if hash[char] > 0
        hash[char] += 1
    end
    return true
end

def dupe_indices(arr)
    hash = Hash.new(0)
    arr.each_with_index do |n, i|
        if hash[n] == 0
            hash[n] = [i]
        else
            hash[n].push(i)
        end
    end
    # debugger
    # for each key, if val (array) lenght < 2, remove that key pair
    new_hash = hash.select do |k,v|
        v.length>=2
    end
    new_hash
end

def ana_array(arr1, arr2)
    
    hash1 = Hash.new(0)
    arr1.each do |ele|
        hash1[ele] += 1
    end

    hash2 = Hash.new(0)
    arr2.each do |ele|
        hash2[ele] += 1
    end

    return hash1 == hash2
    
end