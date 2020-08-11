require "byebug"


def strange_sums(arr)
    hash = Hash.new(false)
    cnt = 0
    # pass through the array just once
    arr.each do |a|
        if hash[-a]
            cnt += 1
        end
        hash[a] = true
    end
    cnt
end

def pair_product(array,product)
    hash = Hash.new(false)
    array.each do |a|
        temp = product/(1.0*a)
        # debugger
        if hash[temp]
            return true
        end
        hash[a*1.0] = true
    end
    false
end

def rampant_repeats(str, hash)
    new_str = ""
    str.each_char do |c|
        if hash.has_key?(c)
            hash[c].times {new_str += c}
        else
            new_str += c
        end
    end
    new_str
end

def perfect_square?(num)
    (0..num).each {|i| return true if i*i == num}
    return false
end
# p strange_sums([1,2,3,4])
# p pair_product([4, 2, 5, 8], 16)
# p perfect_square?(1)
def anti_prime?(num)
    max_f = 0
    (1...num).each do |n|
        tmp = n_factors(n)
        if tmp > max_f
            max_f = tmp
        end
    end
    if n_factors(num)>max_f
        return true
    else
        return false
    end
end
def n_factors(num)
    cnt = 0
    (1..num).each do |n|
        if num % n == 0
            cnt += 1
        end
    end
    cnt
end

def matrix_addition(matrix_a,matrix_b)
    new_mat = Array.new(matrix_a.length) {Array.new(matrix_a[0].length)}
    (0...matrix_a.length).each do |i|
        (0...matrix_a[0].length).each do |j|
            new_mat[i][j] = matrix_a[i][j] + matrix_b[i][j]
        end
    end
    new_mat
end

def mutual_factors(*args)
    hash = Hash.new(0)
    res = []
    args.each do |a|
        get_factors(a,hash)
    end
    hash.each do |k,v|
        if v==args.length
            res.push(k)
        end
    end
    res
end
def get_factors(num,hash)
    (1..num).each do |n|
        if num%n == 0
            hash[n] += 1
        end
    end
end
# p mutual_factors(1,2,3,4,5)

def tribonacci_number(idx)
    if idx == 1
        return 1
    elsif idx == 2
        return 1
    elsif idx == 3
        return 2
    end
    i = 4
    arr = [1,1,2]
    while i<=idx
        arr.push(arr[-1]+arr[-2]+arr[-3])
        i += 1
    end
    arr[-1]
end

def matrix_addition_reloaded(*mats)
    return nil if mats.length < 1
    mm = mats[0].length
    nn = mats[0][0].length
    mats.each do |m|
        if m.length != mm || m[0].length != nn
            return nil
        end
    end
    new_mat = Array.new(mm) {Array.new(nn, 0)}
    (0...mm).each do |i|
        (0...nn).each do |j|
            mats.each do |m|
                new_mat[i][j] += m[i][j]
            end
        end
    end
    new_mat
end

def squarocol?(mat)
    #check each row
    mat.each do |m|
        f_ele = m[0]
        all_same = true
        # debugger
        m.each do |mm|
            # debugger
            all_same &= mm==f_ele
        end
        return true if all_same
    end
    #check each col
    col = 0
    while col <mat[0].length
        f_ele = mat[0][col]
        all_same = true
        (0...mat.length).each do |row|
            all_same &= mat[row][col] == f_ele
        end
        return true if all_same
        col += 1
    end
    false
end
# matrix_a = [[2,5], [4,7]]
# matrix_b = [[9,1], [3,0]]

# p matrix_addition_reloaded(matrix_a, matrix_b)
# p squarocol?([
#         [:a, :x , :d],
#         [:b, :x , :e],
#         [:c, :x , :f]
#     ])

def squaragonal?(mat)
    n = mat.length
    # check UL to BR
    f_ele = mat[0][0]
    i = 0
    j = 0
    all_same = true
    while i<n
        all_same &= f_ele == mat[i][i]
        i+=1
    end
    return true if all_same
    # check BL to UR
    # debugger
    f_ele = mat[n-1][0]
    j = n-1
    i = 0
    all_same = true
    while i<n
        all_same &= f_ele == mat[i][j]
        i+=1
        j-=1
    end
    return true if all_same
    false
end

def pascals_triangle(num)
    res = [[1]]
    return res if num==1
    (1...num).each do |i|
        res.push([1])
        (1...res[-2].length).each do |j|
            res[-1].push(res[-2][j]+res[-2][j-1])
        end
        res[-1].push(1)
    end
    res
end

# p pascals_triangle(1)

def mersenne_prime(num)
    val = 1 # 2^0
    cnt = 0
    while cnt != num
        val *= 2
        cnt +=1 if prime?(val-1)
    end
    val-1
end

def prime?(num)
    return false if num<2
    (2..num/2).each {|n| return false if num%n == 0}
    return true
end


def triangular_word?(str)
    alpha = ("a".."z").to_a
    val = 0
    str.each_char {|c| val += 1+alpha.index(c)}
    # debugger
    return triangular_number?(val)
end
def triangular_number?(num)
    n = num*2
    i = 1
    while i*(i+1) < n
        i+=1
    end
    return true if i*(i+1)==n
    false
end

def consecutive_collapse(arr)
    collapsible = true
    while collapsible
        collapsible = false
        (1...arr.length).each do |i|
            # debugger
            if (arr[i]-arr[i-1]).abs==1
                arr = arr[0...i-1] + arr[i+1..-1]
                collapsible = true
                break
            end
        end
    end
    arr
end

def pretentious_primes(arr, n)
    arr.each_with_index do |a,i|
        cnt = 0
        v = a
        while cnt != n.abs && v > 0
            if n>0
                v += 1
            else
                v -= 1
            end
            cnt += 1 if prime?(v)
        end
        arr[i] = v
        arr[i] = nil if v==0
    end
    arr
end
