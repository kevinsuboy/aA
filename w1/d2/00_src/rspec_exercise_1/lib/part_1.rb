require "byebug" 

def average(num1, num2)
    sum = num1 + num2
    average = sum/2.0
    average
end

def average_array(arr)
    sum = arr.inject { |acc, ele| acc + ele }
    # p arr.length
    sum / (arr.length * 1.0)
end

# debugger 
# p average_array([2, 4, 6])
# p average_array([3, -4, 21, 8])
# p average_array([5, 10])

def repeat(string, num)
    new_string = ""
    num.times do
        new_string += string
    end
    new_string
end

def yell(str)
    str.upcase + "!"
end

def alternating_case(sent_str)
    new_sent = sent_str.split
    res_sent = []
    # debugger
    new_sent.each_with_index do |word,i|
        if i % 2 == 0
            res_sent << word.upcase
        else
            res_sent << word.downcase
        end
    end
    res_sent.join(" ")
end

p alternating_case("hello world, hello world")