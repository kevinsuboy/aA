def hipsterfy(word)
    vowel = "aeiou"

    i = word.length - 1
    while i >= 0
        char = word[i]
        if vowel.include?(char)
            return word[0...i] + word[i+1..-1]
        end
        i -= 1
    end
    return word
end

def vowel_counts(str)
    hash = Hash.new(0)
    vowel = "aeiou"
    str.each_char do |c|
        if vowel.include?(c.downcase)
            hash[c.downcase] += 1
        end
    end
    hash
end

def caesar_cipher(msg, n)
    new_str = ""
    alpha = "abcdefghijklmnopqrstuvwxyz"

    msg.each_char do |c|
        if alpha.include?(c)
            i = alpha.index(c)
            i += n
            i %= 26
            new_str += alpha[i]
        else
            new_str += c
        end
    end

    new_str
end

# p caesar_cipher("apple", 1)