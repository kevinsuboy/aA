class Item
    attr_accessor :title, :description, :done
    attr_reader :deadline
    # Phase 1: One true list
    # Our first iteration of this project will have the TodoBoard only manage a single List which contains many Items.

    # Item
    # Item::valid_date?(date_string)
    # This method should accept a string and return a boolean indicating if it is valid date of the form YYYY-MM-DD where Y, M, and D are numbers, such as 1912-06-23. The month should be a number from 1 to 12 and the day should be a number from 1 to 31. Here are examples of the expected behavior:
    def self.valid_date?(date_string)
        date_string = date_string.split('-')
        return false if date_string.length != 3 # check #1
        return false unless (1..12).to_a.include?(date_string[1].to_i)
        return false unless (1..31).to_a.include?(date_string[2].to_i)
        return true
    end
    # For simplicity, we'll be using well-formed strings to represent our dates. However, if we were building this application for real users, then we would use a more robust solution like Ruby's Date objects. This would allow us to implement advanced features like time of day, timezone, and other niceties. We'll save that battle for another day.

    # Item#initialize(title, deadline, description)
    # This method should accept a title, deadline, and a description as arguments. These three pieces of data should be stored as instance variables of an Item. If the deadline is not a valid date, raise an error.

    # For example, here are examples of two items being created successfully and one invalid item:

    def initialize(title,deadline,description)
        @title = title
        if Item.valid_date?(deadline)
            @deadline = deadline
        else
            raise "error"
        end
        @description = description
        @done = false
    end    
    
# --------------------------------------------------------------------
    
    # Item#title
    # This method should return the item's title.
# --------------------------------------------------------------------

    # Item#title=(new_title)
    # This method should set the item's title.

# --------------------------------------------------------------------

    # Item#deadline
    # This method should return the item's deadline.
# --------------------------------------------------------------------

    # Item#deadline=(new_deadline)
    # This method should set the item's deadline. However, if the new deadline is not a valid date, then it should raise an error and not change the deadline.


    def deadline=(new_deadline)
        @deadline = new_deadline if Item.valid_date?(new_deadline)
    end
# --------------------------------------------------------------------
    # Item#description
    # This method should return the item's description.

# --------------------------------------------------------------------
    # Item#description=(new_description)
    # This method should set the item's description.

    # Checkpoint - Using pry to test
    # At this point we've written all the methods we'll need for an item. Before moving on, we should test our work to avoid accumulating a deficit of buggy code that will be difficult to fix later. Let's use pry to test our work quickly.

    # You should cd into the project folder and run pry. Then, use load 'item.rb' to load your code into the environment, this should return true if the file was successfully loaded. From there, play around with your class by creating an instance and calling some methods on it! If you edit the file you are going to have to load it into the environment again.

    # Here is how we can begin to test our items, but you should be more thorough:

    def toggle
        @done = !@done
    end

end


