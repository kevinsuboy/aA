# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".
def compress_str(str)
    res = ""
    i = 0
    while i<str.length
        j = i
        while str[j] == str[i]
            j+=1
        end
        res += (j-i).to_s if j-i > 1
        res += str[i]
        i = j
    end
    res
end

p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"
