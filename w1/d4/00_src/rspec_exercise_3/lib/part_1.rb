def is_prime?(num)
    return false if num < 2
    (2...num).each do |n|
        return false if num%n==0
    end
    true
end

def nth_prime(n)
    # n = 3 ... ans: [1,2,3,5,7,11,13...]
    cnt = 0
    v = 0
    while cnt != n
        v+=1
        cnt += 1 if is_prime?(v)
    end
    v
end

def prime_range(min,max)
    res = []
    (min..max).each do |n|
        res.push(n) if is_prime?(n)
    end
    res
end