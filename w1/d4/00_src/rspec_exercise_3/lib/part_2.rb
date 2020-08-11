require "byebug"

def element_count(arr)
    hash = Hash.new(0)
    arr.each {|a| hash[a]+=1}
    hash
end

def char_replace!(str, hash)
    (0...str.length).each do |i|
        # debugger
        if hash.has_key?(str[i])
            str[i] = hash[str[i]]
        else
            str[i] = str[i]
        end
    end
    # debugger    str = str.join
    str
end
# string_1 = "hello world"
# p char_replace!(string_1, {"l"=>"7", "e"=>"a", " "=>"-", "o"=>"q"})

def product_inject(arr)
    arr.inject {|acc,el| acc*el}
end

