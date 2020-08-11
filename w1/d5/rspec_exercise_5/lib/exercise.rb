require "byebug"

def zip(*arr)
    arr_len = arr[0].length
    arr.each {|a| return [] if a.length != arr_len }
    new_arr = []
    (0...arr_len).each do |i|
        new_arr.push([]) # push in empty subarray
        arr.each { |a| new_arr[-1].push(a[i]) } # push in latest 1D array of values at i
    end
    new_arr
end

def prizz_proc(arr, prc1, prc2)
    new_arr = []
    arr.each do |a|
        # if prc1.call(a) && !prc2.call(a) || !prc1.call(a) && prc2.call(a)
        if prc1.call(a) ^ prc2.call(a)
            new_arr << a
        end
    end
    new_arr
end

def zany_zip(*arr)
    arr_len = arr[0].length   # find subarr of max length
    arr.each { |a| arr_len = a.length if a.length > arr_len }
    new_arr = []
    (0...arr_len).each do |i|
        new_arr.push([]) # push in empty subarray
        arr.each { |a| new_arr[-1].push(a[i]) } # push in latest 1D array of values at i
    end
    new_arr
end

def maximum(arr, &prc)
    max_el_prc = 0
    max_el = arr[0]
    arr.each do |a|
        if prc.call(a)>=max_el_prc
            max_el_prc = prc.call(a)
            max_el = a
        end
    end
    max_el
end

def my_group_by(arr,&prc)
    # hash = Hash.new([])
    # hash = Hash.new { [] }   # DOES NOT WORK
    hash = Hash.new {|hash,key| hash[key] = []}
    arr.each { |a| hash[prc.call(a)] << a }
    hash
end

def max_tie_breaker(arr, prc, &block)
# maintain 2 variables (max_ele, max_ele_block)
# for each arr ele in reverse, if results of block > max_ele_block, update max_ele.
# elsif = max_ele_block, then execute proc, update max_ele with results of proc
    max_ele = arr[-1]
    # max_ele_block = 0
    arr.reverse.each do |a|
        if block.call(a) > block.call(max_ele) #max_ele_block
            max_ele = a
            # max_ele_block = block.call(a)
        elsif block.call(a) == block.call(max_ele) #max_ele_block # tie scenario
            if prc.call(a) >= prc.call(max_ele) # >=
                max_ele = a # max_ele_block = prc.call(a)
            end
        end
    end
    max_ele
end

def silly_syllables(sent)
    # go thru each word
    # helper to return word after 'filtering'
    # shovel word to new sent
    sent.split.map { |word| filter(word) }.join(" ")
end

def filter(word)
    #each char, if vowel, add to arr
    # check lenght of arr
    #get 1st/last of arr

    # check for # of vowels
        # return word if #<2
    # get 1st/last index
    i = word.index(/[aeiouAEIOU]/) # 1st
    return word if !i # if no vowels, give original word
    j = (word.length-1)-word.reverse.index(/[aeiouAEIOU]/) # last
    return word if i==j
    word[i..j]
    # return b/w [1st..last]
end
