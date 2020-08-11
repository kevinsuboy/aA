def reverser(str, &prc)
    prc.call(str.reverse)
end

def word_changer(str, &prc)
    arr = str.split
    new_arr = arr.map { |ele| prc.call(ele) }
    new_arr.join(" ")
end


def greater_proc_value(num, prc1, prc2)
    res1=prc1.call(num)
    res2=prc2.call(num)
    if res1>res2
        return res1
    else
        return res2
    end
end

def and_selector(arr,prc1,prc2)
    arr.select {|a| a if prc1.call(a) && prc2.call(a)}
end

def alternating_mapper(arr,prc1,prc2)
    arr.each_with_index do |a,i|
        if i%2==0
            arr[i] = prc1.call(a)
        else
            arr[i] = prc2.call(a)
        end
    end
    arr
end
