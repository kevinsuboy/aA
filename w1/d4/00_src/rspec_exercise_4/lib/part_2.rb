def proper_factors(num)
    new_arr = []
    (1...num).each {|n| new_arr.push(n) if num%n==0 }
    new_arr
end

def aliquot_sum(num)
    (proper_factors(num)).sum
end

def perfect_number?(num)
    num == aliquot_sum(num)
end

def ideal_numbers(n)
    arr = []
    v = 5
    while arr.length < n
        v+=1
        arr.push(v) if perfect_number?(v)
    end
    arr
end
