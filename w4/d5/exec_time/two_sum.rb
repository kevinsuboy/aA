require 'byebug'
def two_sum_b?(arr,target_sum)
    (0...arr.length).each do |i| #n
        (i+1...arr.length).each do |j| #n 
            return true if arr[i]+arr[j] == target_sum
        end
    end
    return false
end

def two_sum_s?(arr,target_sum)
    sorted = arr.sort # n log n ... merge sort // quick -> n logn
    (0...sorted.length).each do |i| # n
        el_p = target_sum - sorted[i] # 1
        return true if bsearch(sorted[i+1..-1], el_p) # log n
    end
    false
end

def bsearch(arr,target_sum)
    l = 0
    r = arr.length-1
    while l<r
        m = (r-l)/2 + l
        if arr[m] < target_sum
            l = m+1
        else
            r = m
        end
        # debugger
    end
    return arr[l] == target_sum
end

def two_sum_h?(arr,target_sum)
    hash = Hash.new() #1
    arr.each do |el| #n
        el_p = target_sum - el # t = 10, el = 5 (second)
        return true if hash.has_key?(el_p) # if we created hash earlier, this would produce true (false positive)
        # if we created hash aafter, this would produce false (true negative)
        hash[el] = true
    end
    return false
end


if __FILE__ == $PROGRAM_NAME
    arr = Array.new(1000){rand(-100..100)}
    target_sum = rand(-100..100)
    # arr = [4,3,6,5,3,11]
    # target_sum = 18
    t1 = Time.now
    p two_sum_b?(arr,target_sum)
    p Time.now-t1

    t1 = Time.now
    p two_sum_s?(arr,target_sum)
    p Time.now-t1

    t1 = Time.now
    p two_sum_h?(arr,target_sum)
    p Time.now-t1
end