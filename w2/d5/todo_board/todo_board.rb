# This is where things comes together. The TodoBoard class will be responsible for receiving user input and performing the correct action on the stored list. In this phase of the app, the board will only manage a single list. Because of this, you may find it trivial to implement these board methods since they simply delegate responsibility to the list methods. We design it in this way in order to have an extensible class that we can easily refactor for more features in phase two.

# You should be using many List methods in the following steps. There is a method to the madness!
require_relative 'list.rb'
require 'byebug'
class TodoBoard
# TodoBoard#initialize(label)
# For now, a TodoBoard will only need create a single List with the given label and store it as an instance variable.
    def initialize()
        # @list = List.new(label)
        @board = Hash.new()
    end
# TodoBoard#get_command
# This method should prompt the user to enter a command and perform the appropriate action on the list. The user may enter any of the following commands with arguments separated with spaces:
    def get_command
        print "\nEnter a command: "
        cmd, *args = gets.chomp.split(' ')
        # gets = "up 0 9"
        # gets.chomp.split = ["up", "0", "9"]
        # cmd, *args = ["up", "0", "9"]

        # gets.chomp.split = ["mktodo", "A", "B", "C"]
        # cmd, *args = ["mktodo", "A", "B", "C"] =>
            # cmd = "mktodo"
            # *args = ["A", "B", "C"]

        case cmd # if cmd ==
            when 'mklist'
                @board[args[0]] = List.new(args[0])
            when 'ls'
                p @board.keys
            when 'showall'
                @board.each {|k,v| v.print}
            when 'mktodo' # "make todo" list
                list = @board[args[0]]
                list.add_item(*args[1..-1])
            when 'up'
                args.map!{|a|a.to_i}
                list = @board[args[0]]
                list.up(*args[1..-1])
            when 'down' 
                args.map!{|a|a.to_i}
                list = @board[args[0]]
                list.down(*args[1..-1])
            when 'swap'
                # args[1..-1] = ["1","2"]
                # want it to be [1,2]
                args.map!{|a|a.to_i}
                list = @board[args[0]]
                list.swap(*args[1..-1])
            when 'sort' 
                list = @board[args[0]]
                list.sort_by_date!
            when 'print'
                # debugger
                list = @board[args[0]]
                if args.length > 1 # cmd, args[1..-1] = ["print"]
                    # cmd = "print"
                    # args = [1]
                    args.map!{|a|a.to_i}
                    list.print_full_item(*args[1..-1])
                else 
                    list.print
                end
            when 'priority'
                list = @board[args[0]]
                list.print_priority
            when 'toggle'
                list = @board[args[0]]
                args.map!{|a|a.to_i}
                list.toggle_item(*args[1..-1])
            when 'rm'
                args.map!{|a|a.to_i}
                list = @board[args[0]]
                list.remove_item(*args[1..-1])
            when 'purge'
                list = @board[args[0]]
                list.purge
            when 'quit' 
                return false
            else
                print "Sorry, that command is not recognized."
        end

        true
    end

# mktodo <title> <deadline> <optional description>
# makes a todo with the given information
# up <index> <optional amount>
# raises the todo up the list
# down <index> <optional amount>
# lowers the todo down the list
# swap <index_1> <index_2>
# swaps the position of todos
# sort
# sorts the todos by date
# priority
# prints the todo at the top of the list
# print <optional index>
# prints all todos if no index is provided
# prints full information of the specified todo if an index is provided
# quit
# returns false
# For every command except quit, the method should return true after performing the command. We will leverage this boolean later to control if we should ask the user for another command or exit.

# We recommend you use the splat operator * to easily handle the variable number of user arguments. We'll also require a lot of conditional logic to implement the command handling. For scenarios like this, using a case statement is much more preferable than a verbose chain of elsifs. For example, here is how we might write a partial #get_command that only supports mktodo and quit:

# A small detail we can worry about later is that the user will enter their command with spaces separating their arguments. This will cause issues if they use any spaces within the text for the todo's title or description. We'll ignore this caveat for now.

# TodoBoard#run
# This method will contain our main loop that will keep prompting the user until #get_command returns false.

    def run
        while get_command
        end
    end

# Use pry to test by calling #run on a board. Then, you can enter commands to test the app. Here is a list of commands that we entered to check out our board.


end