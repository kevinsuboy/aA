require "byebug"

def partition(array, n)
    new_array = [[],[]]
    array.each do |a|
        if a < n
            new_array[0].push(a)
        else
            new_array[1].push(a)
        end
    end
    new_array
end
# 1 new hash, both k/v pairs
# 2 if dupli, k/v from 2
# 3 not change original
def merge(hash1,hash2)
    new_hash = {}
    # debugger
    hash1.each do |k,v|
        # debugger
        new_hash[k] = v
    end
    hash2.each do |k,v|
        # debugger
        new_hash[k] = v
    end
    # debugger
    new_hash
end

# hash_1 = {"a"=>10, "b"=>20}
# hash_2 = {"c"=>30, "d"=>40, "e"=>50}
# p merge(hash_1, hash_2)

def censor(sent, c_arr)
    vowel = "aeiou"
    sent = sent.split(" ")
    sent.each_with_index do |word, i|
        # debugger
        c_arr.each do |a|
            if word.downcase == a.downcase
                # debugger
                new_word = word.split("").map do |c|
                    if vowel.include?(c.downcase)
                        "*"
                    else
                        c
                    end
                end
                sent[i] = new_word.join("")
            end
        end
    end
    sent.join(" ")
end

# num
def power_of_two?(num)
    return false if num < 0
    v = 1
    num.times do
        if num == v
            return true
        elsif v > num
            return false
        end
        v *= 2
    end
    return false
end

# p censor("SHUT THE FRONT DOOR", ["door"])