def my_map(arr, &prc)
    new_arr = []
    arr.each { |ele| new_arr << prc.call(ele) }
    new_arr
end

def my_select(arr, &prc)
    new_arr = []
    arr.each { |ele| new_arr << ele if prc.call(ele) }
    new_arr
end

# p my_select([1,2,3,8]) { |n| n.even? }
      
def my_count(arr, &prc)
    count = 0
    arr.each { |ele| count += 1 if prc.call(ele) }
    count
end

def my_any?(arr, &prc)
    b = false
    arr.each{ |ele| b |= prc.call(ele)}
    b
end

def my_all?(arr, &prc)
    b = true
    arr.each { |ele| b &= prc.call(ele) }
    b
end

def my_none?(arr, &prc)
    b = false
    arr.each {|ele| b |= prc.call(ele)}
    !b
end