# Define your methods here. 
def first_letter_vowel_count(sent)
    sent.split.count {|word| "aeiouAEIOU".include?(word[0])}
end
def count_true(arr,prc)
    arr.count {|a| prc.call(a)}
end
def procformation(arr,prc1,prc2,prc3)
    arr.map! do |a|
        if prc1.call(a)
            prc2.call(a)
        else
            prc3.call(a)
        end
    end
end
def array_of_array_sum(arr_2d)
    arr_2d.sum{|arr| arr.sum}
end
def selective_reverse(sent)
    sent.split.map! do |word|
        if !("aeiouAEIOU".include?(word[0]) || "aeiouAEIOU".include?(word[-1]))
            word.reverse
        else
            word
        end
    end.join(" ")
end
def hash_missing_keys(hash,*keys)
    keys.select {|k| !hash.has_key?(k)}
end


