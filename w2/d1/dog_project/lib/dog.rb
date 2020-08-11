require "byebug"
class Dog
    def initialize(name,breed,age,bark,favorite_foods)
        @name = name
        @breed = breed 
        @age = age
        @bark = bark
        @favorite_foods = favorite_foods
        # debugger
    end
    def name
        @name
    end

    def breed
        @breed
    end

    def age
        @age
    end

    def age=(new_age)
        @age = new_age
    end

    def bark
        return @bark.upcase if @age > 3
        @bark.downcase
    end

    def favorite_foods
        @favorite_foods
    end

    def favorite_food?(str)
        @favorite_foods.any? {|food| food.downcase == str.downcase} 
    end

end

