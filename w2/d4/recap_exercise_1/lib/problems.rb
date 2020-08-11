# Write a method, all_vowel_pairs, that takes in an array of words and returns all pairs of words
# that contain every vowel. Vowels are the letters a, e, i, o, u. A pair should have its two words
# in the same order as the original array. 
#
# Example:
#
# all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"])   # => ["action europe", "tear impromptu"]
require 'byebug'

def all_vowel_pairs(words)
    vowels = "aeiou".split("")
    results = []
    (0...words.length).each do |i|
        (i+1...words.length).each do |j|
            big_word = words[i] + " " + words[j]
            results.push(big_word) if vowels.all?{|c| big_word.include?(c)}
        end
    end
    results
end




# Write a method, composite?, that takes in a number and returns a boolean indicating if the number
# has factors besides 1 and itself
#
# Example:
#
# composite?(9)     # => true
# composite?(13)    # => false
def composite?(num)
    # not prime
    (2...num).any? {|n| num%n==0}
end


# A bigram is a string containing two letters.
# Write a method, find_bigrams, that takes in a string and an array of bigrams.
# The method should return an array containing all bigrams found in the string.
# The found bigrams should be returned in the the order they appear in the original array.
#
# Examples:
#
# find_bigrams("the theater is empty", ["cy", "em", "ty", "ea", "oo"])  # => ["em", "ty", "ea"]
# find_bigrams("to the moon and back", ["ck", "oo", "ha", "at"])        # => ["ck", "oo"]
def find_bigrams(str, bigrams)
    words = str.split
    res = []
    bigrams.each do |b|
        words.each do |word|
            (0...word.length - 1).each do |i|
                pair = word[i] + word[i + 1]
                if pair == b
                    res << b
                end
            end
        end
    end
    res
end

class Hash
    # Write a method, Hash#my_select, that takes in an optional proc argument
    # The method should return a new hash containing the key-value pairs that return
    # true when passed into the proc.
    # If no proc is given, then return a new hash containing the pairs where the key is equal to the value.
    #
    # Examples:
    #
    # hash_1 = {x: 7, y: 1, z: 8}
    # hash_1.my_select { |k, v| v.odd? }          # => {x: 7, y: 1}
    #
    # hash_2 = {4=>4, 10=>11, 12=>3, 5=>6, 7=>8}
    # hash_2.my_select { |k, v| k + 1 == v }      # => {10=>11, 5=>6, 7=>8})
    # hash_2.my_select                            # => {4=>4}
    def my_select(&prc)
        prc ||= Proc.new { |k, v| k == v }
        result = Hash.new
        self.each do |k, v|
            if prc.call(k, v)
                result[k] = v
            end
        end
        # new Hash
        # k/v pairs when prc.call==true (regardless of prc)
        # default prc
            # k == v
        result
    end
end

class String
    # Write a method, String#substrings, that takes in a optional length argument
    # The method should return an array of the substrings that have the given length.
    # If no length is given, return all substrings.
    #
    # Examples:
    #
    # "cats".substrings     # => ["c", "ca", "cat", "cats", "a", "at", "ats", "t", "ts", "s"]
    # "cats".substrings(2)  # => ["ca", "at", "ts"]
    # "cats".substrings(3)  # => ["cat", "ats"]
    # "cats".substrings(4)  # => ["cats"]
    def substrings(length = nil)
        # if(!length) # if length was still nil, this line executes
        #     # "NIL" means 'nothing/non-existent'
        # if(length) # if length has a value
        results = []
        if(!length)
            (0...self.length).each do |i|
                (i...self.length).each do |j|
                    results << self[i..j]
                end
            end
        else
            (0...self.length-length+1).each do |i|
                results << self[i...i+length]
            end
        end
        results
    end


    # Write a method, String#caesar_cipher, that takes in an a number.
    # The method should return a new string where each char of the original string is shifted
    # the given number of times in the alphabet.
    #
    # Examples:
    #
    # "apple".caesar_cipher(1)    #=> "bqqmf"
    # "bootcamp".caesar_cipher(2) #=> "dqqvecor"
    # "zebra".caesar_cipher(4)    #=> "difve"
    def caesar_cipher(num)
        alpha = ("a".."z").to_a
        new_str = ""
        self.each_char do |c|
            old_idx = alpha.index(c)
            new_idx = (old_idx + num)%alpha.length
            new_str += alpha[new_idx]
        end
        new_str
    end
end
