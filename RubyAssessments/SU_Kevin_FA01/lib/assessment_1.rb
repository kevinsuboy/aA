# Define your methods here.
require "byebug"
def string_map!(str, &prc)
    str.split("").each_with_index {|c,i| str[i] = prc.call(c)}.join
end
def three?(arr, &prc)
    arr.count {|a| prc.call(a)} == 3
end
def nand_select(arr,prc1,prc2)
    arr.select {|a| !(prc1.call(a)&&prc2.call(a))}
end
def hash_of_array_sum(hash)
    sum = 0
    hash.each do |k,v|
        sum += hash[k].sum
    end
    sum
end
def abbreviate(sent)
    vowels = "aeiouAEIOU"
    sent.split.map! do |word|
        # debugger
        if word.length>4
            word.split("").select{|c| !vowels.include?(c)}.join("")
        else
            word
        end
    end.join(" ")
end
def hash_selector(hash, *keys)
    new_hash=hash
    hash.each {|k,v| new_hash.delete(k) if keys.length>0 && !keys.include?(k)}
    new_hash
end