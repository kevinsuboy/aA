def select_even_nums(arr)
    arr.select { |ele| ele % 2 == 0 }
end

def reject_puppies(arr)
    arr.reject { |hash| hash["age"] <= 2 }
end

def count_positive_subarrays(arr)
    arr.count {|sub| sub.inject{|acc,el| acc+el} > 0}
end

def aba_translate(word)
    vowel = "aeiou"
    new_word = word.split("").map do |c|
        if vowel.include?(c)
            c + "b" + c
        else
            c
        end
    end
    new_word.join
end

def aba_array(arr)
    arr.map { |word| aba_translate(word) }
end