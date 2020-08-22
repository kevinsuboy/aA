def my_min(list)
    # p "implement me"
    # phase 1
    # list.each do |el1| # n
    #     return el1 if list.all?{|el2| el1<=el2} # n
    # end
    # phase 2
    min = list[0]

    list.each do |el| # n
        min = el if el < min # 1
    end
end

def largest_contiguous_subsum(list)
    # arr = []
    # (0...list.length).each do |i| # n
    #     (i...list.length).each do |j| #n
    #         arr << list[i..j]
    #     end
    # end
    # # p arr
    # sum = []
    # arr.each do |sub| #n
    #     sum << sub.sum
    # end
    # # p sum
    # max = sum[0]
    # sum.each do |el| # n
    #     max = el if el > max 
    # end
    # max

    cur_max = list[0]
    max_max = list[0] # what we want to return
    (1...list.length).each do |i|
        # Should I keep continue with you (cur_max), or should I start again?
        # if cur_max+list[i]>list[i] # we are better together
        if cur_max>0 # we are better together
            cur_max += list[i]
        else # i don't need you, cur_max
            cur_max = list[i]
        end
        max_max = cur_max if cur_max > max_max # recording max
    end
    max_max
end

if __FILE__ == $PROGRAM_NAME
    # list = Array.new(100000000){rand(-100..100)}
    # t1 = Time.now
    # my_min(list)
    # p Time.now - t1

    p list = Array.new(4){rand(-100..100)}
    t1 = Time.now
    p largest_contiguous_subsum(list)
    p Time.now - t1



end