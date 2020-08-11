require_relative 'item.rb'

class List
    attr_accessor :label
    # List
    # An instance of List may contain many items. To do this, our List will have an underlying array. A list will also have a label.

# --------------------------------------------------------------------
    # List#initialize(label)
    # This method should accept a label as an argument and store the label of the list as an instance variable. Also initialize instance variable called items to an empty array. The array will eventually contain instances ofItem.
    def initialize(label)
        @label = label
        @items = []
    end
# --------------------------------------------------------------------
    # List#label
    # This method should return the list's label.
# --------------------------------------------------------------------
    # list#label=(new_label)
    # This method should set the list's label.
# --------------------------------------------------------------------
    # List#add_item(title, deadline, description)
    # This method should accept a title, deadline, and optional description as arguments. This method should create a new Item with the given information and add it to the end of the items array. When no description is passed in, the new item should have an empty description. If the given deadline is not valid, then no item should be added and the method should return false. If the item is successfully added, then the method should return true. Don't forget to require your 'item.rb' file into 'list.rb'.
    def add_item(title, deadline, description="")
        if Item.valid_date?(deadline)
            @items << Item.new(title, deadline, description)
            return true
        else
            return false
        end
    end
# --------------------------------------------------------------------
    # List#size
    # This method should return the number of items currently in the list.
    def size
        @items.length
    end
# --------------------------------------------------------------------
    # List#valid_index?(index)
    # This method should return a boolean indicating whether or not the given number is a valid position in the list. The first item of the list has index 0, the second item has index 1, and so on. A number is not a valid index if it is negative or too large given the current amount of items in the list.

    # Here's some food for thought. This method is similar to Item::valid_date?. However, why did we decide to make Item::valid_date? a class method but List#valid_index? an instance method? The reason is that #valid_index? requires knowledge about a specific List instance. That is, an index may be valid or invalid depending on the size of the list it is to be used on. On the flip side, valid_date? does not require any knowledge of a specific Item. That is, we do not need to know any information about any item to know if the date is formatted correctly. Ah, such practical design decisions!
    def valid_index?(index)
        return false if index<0 || index>=self.size
        return true
    end
# --------------------------------------------------------------------
    # List#swap(index_1, index_2)
    # This method should swap the position of the items at the given indices in the list. If either index is invalid, then don't swap any items and return false. If the indices are valid, then swap the items and return true.
    def swap(index_1, index_2)
        return false if !valid_index?(index_1) || !valid_index?(index_2)
        @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
        return true
    end
    # Bracket method for list List#[](index)
    # This method should return the item of the list that is stored at the given index. If the index is invalid, then return nil. It is important that we define access to items of the list with a custom bracket method and not expose a reader or writer for the instance variable directly (@items). This is to prevent a user from manually manipulating the list in silly ways, like adding non Item instances to the list or having empty entries in the list. We encourage users to only manipulate the list according to the rules and methods that we have defined.
    def [](index)
        return nil if !valid_index?(index) 
        @items[index]
    end

# --------------------------------------------------------------------
    # List#priority
    # This method should return the item at the the top of the list.

    def priority
        @items[0]

    end

    # Checkpoint - Basic list functionality
    # At this point, we have written a few methods that are critical to our application. Let's test these thoroughly in pry before moving on. As always, here are some basic scenarios that we used to test our List, but you should be more exhaustive:



# --------------------------------------------------------------------
    # List#print
    # This method should print the label of the list and each item's title and deadline. For usability, also print the position of each item in the list. For example, here is a nice way to format the output:
    def print
        p "".ljust(50, "-")
        p @label.upcase.rjust(27, " ")
        p "".ljust(50, "-")
        p "Index | Item                | Deadline     | Done"
        p "".ljust(50, "-")
        @items.each_with_index do |item, i|
            p "#{i}".ljust(6," ") + "#{item.title}".ljust(20, " ") + "#{item.deadline}" + "|"+ "#{item.done}"
        end 
        p "".ljust(50, "-")
    end

    # ------------------------------------------
    #                 GROCERIES
    # ------------------------------------------
    # Index | Item                 | Deadline
    # ------------------------------------------
    # 0     | cheese               | 2019-10-25
    # 1     | toothpaste           | 2019-10-25
    # 2     | shampoo              | 2019-10-24
    # 3     | candy                | 2019-10-31
    # ------------------------------------------
    # You don't need to spend too much time making the formatting pretty like we did above. However, if you are interested, we used String#ljust to pad strings with spaces to ensure that the columns have equal length. We also used string interpolation to avoid tedious concatenations.

    # List#print_full_item(index)
    # This method should print all information for the item at the given index, including the title, deadline, and description. The method should not print anything if the index not valid. Here is how we formatted our output for #print_full_item:
    def print_full_item(index)
        if valid_index?(index)
            p @items[index].title
            p @items[index].deadline
            p @items[index].description            
            p @items[index].done            
        end
    end
    # ------------------------------------------
    # candy                           2019-10-31
    # 4 bags should be enough
    # ------------------------------------------
    # List#print_priority
    # The method should print all information for the item at the top of the list.
    def print_priority
        print_full_item(0)
    end
    # List#up(index, amount)
    # This method should move the item at the given index up the list by continually swapping it with the item directly above it the given amount of times. If the given index is not valid, then it should return false without modifying the list. If the index is valid, then it should return true. When the specified item needs to move up further, but is already at the top of the list, then it should remain at the top. If an amount is not passed in, then move the item up 1 position.
    def up(index, amount=1)
        return false if !valid_index?(index)
        while index > 0 && amount > 0
            swap(index, index - 1)
            index -= 1
            amount -= 1
        end 
        return true
    end
    # List#down(index, amount)
    # This method should move the item at the given index down the list by continually swapping it with the item directly below it the given amount of times. If the given index is not valid, then it should return false without modifying the list. If the index is valid, then it should should return true. When the specified item needs to move down further, but is already at the bottom of the list, then it should remain at the bottom. If an amount is not passed in, then move the item down 1 position.

    def down(index, amount=1)
        return false if !valid_index?(index)
        while index < size - 1 && amount > 0 
            swap(index, index + 1)
            index += 1
            amount -= 1
        end 
        return true
    end

    # Checkpoint - Up, down, all around
    # The last few methods required some complex logic. Let's verify their functionality in pry before we go any further down the rabbit hole. Create a list with some items and try moving them around with #up and #down, use #print frequently to check the outcome. Here is how we began to test our list:


    # Our lists are looking pretty great! Only one more method to implement on this class.

    # List#sort_by_date!
    # This method should sort the items in the list according to their deadlines. The method should mutate the list's underlying array.
    def sort_by_date!
        @items.sort_by!{|item| item.deadline.split("-").join.to_i} # sort this
    end
    # We can use Ruby's Array#sort_by! to perform this task. In general, the Array#sort_by! method is called on an array and will sort the array in place according to the criteria specified by the block. Here is an example:
    
    # It's worth mentioning that when the block for Array#sort_by! returns a number, the array will be sorted in increasing order according to those number values. When the block returns a string, the array will be sorted in "alphabetical" order according to those string values. If a string contains a numeric character, it can still be interpreted as having an "alphabetical" order. That is, the character '1' comes before the character '2', alphabetically.

    # Up until this point, we've been very strict in enforcing what strings are stored as deadlines in our items. Now we get reap the benefit! Here is how your method might behave:
    def toggle_item(index)
        @items[index].toggle
    end
    def remove_item(index)
        if valid_index?(index)
            @items.delete(@items[index])
            return true
        else
            return false
        end
    end
    def purge
        i = 0
        while i < @items.length
            if @items[i].done
                remove_item(i)
            else
                i+=1
            end
        end
    end
end