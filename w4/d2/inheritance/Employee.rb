require_relative "Manager.rb"
require 'byebug'
class Employee
    attr_reader :name, :title, :salary, :boss
    # def initialize(name="Everyman", title="Zombie", salary=-10, boss="The Devil")
    def initialize(name, title, salary, boss)
        @name, @title, @salary, @boss = name, title, salary, boss
        # once we have "boss" obj, we need to update boss_obj's subordinates
        # debugger if !boss
        @boss.subordinates << self if boss
    end
    def bonus(multiplier)
        @salary * multiplier
    end
    def sub_sum
        0
    end
end
