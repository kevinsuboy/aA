def palindrome?(word)
    i = 0
    while i < word.length / 2
        return false if word[i] != word[word.length - 1 - i]
        i += 1
    end
    return true
end

def substrings(str)
    arr = []
    i = 0
    j = 0
    str = str.split("")
    while(i<str.length)
        j = i
        while(j<str.length)
            arr.push(str[i..j].join)
            j+=1
        end
        i += 1
    end
    # str.each_char.with_index do |c,i|
    #     new_word = ""
    #     str.each_char.with_index do |c2,i2|
    #         if i<i2
    #             new_word += c2
    #         end
    #     end
    #     arr.push(new_word)
    # end
    arr
end

# p substrings("jump")

def palindrome_substrings(word)
    array = substrings(word)
    result = [] 
    array.each do |a|
        result.push(a) if palindrome?(a) && a.length > 1
    end
    result
end