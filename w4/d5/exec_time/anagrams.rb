def anagrams_p1(str1,str2)
    arr = str1.split("").permutation(str1.length).to_a # n!
    arr.each {|sub| return true if sub.join == str2} # n
    false # n! + n... lim n->inf
    # O(n!)
end

def anagrams_p2(str1,str2)
    str2 = str2.split("") # 1 
    str1.each_char do |c| # n times
        # (str2.find_index(c).nil?) ? return false : str2.delete_at(str2.find_index(c))
        idx = str2.find_index(c) # n times... search
        return false if idx == nil
        str2.delete_at(idx) # 1 times... n times
    end
    
    return str2.empty?
    # O(n^2)
end
def anagrams_p3(str1,str2)
    str1.chars.sort.join == str2.chars.sort.join # n log n .. nk (dicated by ruby)
    # O(n log n)
end

def anagrams_p4(str1,str2)
    # making hash1... n chars
    # making hash2... n chars
    # hash1 == hash2... n times O(n)
    hash1 = Hash.new(0)
    hash2 = Hash.new(0)

    str1.each_char {|c| hash1[c] += 1} # n
    str2.each_char {|c| hash2[c] += 1} # n
    hash1 == hash2 # it each k, com v, n
    # space: hash1 n, hash2 n, O(10*n)


    #making hash1... n
    #reducing hash1 with str chars... n
    #space hash1 n

    # 3n -> 3n.... sp: 2n -> 1n
    # hash1 = Hash.new(0)
    # str1.each_char {|c| hash1[c] += 1} # n
    # str2.each_char do |c| # n
    #     return false if hash1[c]==0
    #     hash1[c] -= 1
    # end
    # hash.each do |k,v| # n
    #     return false if v>0
    # end
    # return true
end


if __FILE__ == $PROGRAM_NAME
    str1 = Array.new(500000){('a'..'z').to_a.sample}.join
    str2 = Array.new(500000){('a'..'z').to_a.sample}.join
    # str1 = "hello"
    # str2 = "leloho"
    # t1 = Time.now
    # p anagrams_p1(str1,str2)
    # p Time.now-t1

    # t1 = Time.now
    # p anagrams_p2(str1,str2)
    # p Time.now-t1

    t1 = Time.now
    p anagrams_p3(str1,str2)
    p Time.now-t1

    t1 = Time.now
    p anagrams_p4(str1,str2)
    p Time.now-t1
end