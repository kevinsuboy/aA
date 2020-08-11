require "employee"

class Startup
    attr_reader :name, :funding, :salaries, :employees
    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries # hash
        @employees = []
    end
    def valid_title?(title)
        return @salaries.has_key?(title)
    end
    def >(startup)
        return self.funding > startup.funding
    end
    def hire(employee_name, title)
        if !self.valid_title?(title)
            raise_error
        else
            @employees << Employee.new(employee_name, title)
        end
    end
    def size
        employees.length
    end
    def pay_employee(employee_obj)
        salary = @salaries[employee_obj.title] # @salaries is hash of titles/salary
        if @funding > salary
            employee_obj.pay(salary)
            @funding -= salary
        else
            raise_error
        end
    end
    def payday
        @employees.each {|employee_obj| pay_employee(employee_obj)}
    end
    # --------------- Part 3 ---------------
    def average_salary
        total_salary = 0
        @employees.each {|employee_obj| total_salary += @salaries[employee_obj.title]}
        total_salary*1.0/employees.length
    end
    def close
        @employees = []
        @funding = 0
    end

    
    def acquire(startup_2)
        @funding += startup_2.funding
        startup_2.salaries.each do |k,v|
            if !@salaries.has_key?(k)
                @salaries[k] = v
            end
        end
        startup_2.employees.each do |employee_2|
            @employees << employee_2
        end
        startup_2.close
    end

end
