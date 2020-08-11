require "byebug"

def my_reject(arr, &prc)
    new_arr = []
    arr.each {|a| new_arr.push(a) if !prc.call(a)}
    new_arr
end

def my_one?(arr, &prc)
    cnt = 0
    arr.each {|a| cnt+=1 if prc.call(a)}
    return cnt == 1
end

def hash_select(hash, &prc)
    hash.each {|k,v| hash.delete(k) if !prc.call(k,v)}
end

def xor_select(arr, prc1, prc2)
    arr.select {|a| (prc1.call(a) && !prc2.call(a)) || (!prc1.call(a) && prc2.call(a)) }
end

def proc_count(num, arr_prc)
    cnt = 0
    arr_prc.each { |prc| cnt += 1 if prc.call(num)}
    cnt
end