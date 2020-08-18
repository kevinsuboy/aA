require_relative "Employee.rb"

class Manager < Employee
    # def initialize # test whether args are needed
    attr_accessor :subordinates
    def initialize(name, title, salary, boss)
        @subordinates = []
        super
    end
    def bonus(multiplier)
        self.sub_sum * multiplier
    end
    def sub_sum
        # loop each sub
            # for each sub, loop their subs
            #etc
        # e0 = sub[0]
        # e1 = sub[1]

        # sum_of_subs = e0.sub_sum + e1.sub_sum + etc.
        # #               E               M       M
        # #               0           e0+e1+etc

        @subordinates.sum {|e| e.salary+e.sub_sum}

    end
end
