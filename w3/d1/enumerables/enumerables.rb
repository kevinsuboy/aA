require 'byebug'

class Array
    def my_each(&prc)
        i = 0
        while i<self.length
            prc.call(self[i])
            i+=1
        end
        self
    end
    def my_select(&prc)
        arr = []
        self.my_each {|el| arr.push(el) if prc.call(el)}
        arr
    end
    def my_reject(&prc)
        arr = []
        self.my_each {|el| arr.push(el) unless prc.call(el)}
        arr
    end
    def my_any?(&prc)
        self.my_each {|el| return true if prc.call(el)}
        false
    end
    def my_all?(&prc)
        self.my_each {|el| return false unless prc.call(el)}
        true        
    end
    def my_flatten
        self.my_flat_help(self)
    end
    def my_flat_help(arr)
        return [arr] if !arr.is_a?(Array)
        res = self.my_flat_help(arr[0])
        (1...arr.length).each {|i| res += self.my_flat_help(arr[i])}
        res
    end
    def my_zip(*args)
        l = 0
        arr = Array.new(self.length){Array.new(args.length+1)}
        (0...self.length).each do |i|
            arr[i][0] = self[i]
        end
        k = 0
        (1..args.length).each do |j|
            (0...self.length).each do |i|
                if args[j-1]
                    arr[i][j] = args[j-1][i]
                end
            end
        end
        arr
    end
    def my_rotate(rot = 1)
        # debugger
        arr = self.map{|el| el}
        while rot > 0
            arr.push(arr.shift())
            rot -= 1
        end
        while rot < 0
            arr.unshift(arr.pop())
            rot += 1
        end
        arr
    end
    def my_join(sep = "")
        res = self[0]
        (1...self.length).each {|i| res += sep+self[i]}
        res
    end
    def my_reverse
        (0...self.length).reverse.map {|i| self[i]}
    end
end

if __FILE__ == $PROGRAM_NAME
    # # calls my_each twice on the array, printing all the numbers twice.
    # return_value = [1, 2, 3].my_each do |num|
    #     puts num
    # end.my_each do |num|
    #     puts num
    # end
    #     # 1
    #     # 2
    #     # 3
    #     # 1
    #     # 2
    #     # 3

    # p return_value  # => [1, 2, 3]
    #
    # a = [1, 2, 3]
    # p a.my_select { |num| num > 1 } # => [2, 3]
    # p a.my_select { |num| num == 4 } # => []end
    #
    # a = [1, 2, 3]
    # p a.my_reject { |num| num > 1 } # => [1]
    # p a.my_reject { |num| num == 4 } # => [1, 2, 3]
    # a = [1, 2, 3]
    # p a.my_any? { |num| num > 1 } # => true
    # p a.my_any? { |num| num == 4 } # => false
    # p a.my_all? { |num| num > 1 } # => false
    # p a.my_all? { |num| num < 4 } # => true
    # p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]
    #
    # a = [ 4, 5, 6 ]
    # b = [ 7, 8, 9 ]
    # p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
    # # debugger
    # p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
    # p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

    # c = [10, 11, 12]
    # d = [13, 14, 15]
    # p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]
    #
    # a = [ "a", "b", "c", "d" ]
    # p a.my_rotate         #=> ["b", "c", "d", "a"]
    # p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
    # p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
    # p a.my_rotate(15)     #=> ["d", "a", "b", "c"]
    #
    # a = [ "a", "b", "c", "d" ]
    # p a.my_join         # => "abcd"
    # p a.my_join("$")    # => "a$b$c$d"
    #
    p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
    p [ 1 ].my_reverse               #=> [1]
end

