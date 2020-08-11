load 'todo_board.rb'
# => true

my_board = TodoBoard.new('groceries')
# => #<TodoBoard:0x @list=#<List:0x @items=[], @label="groceries">>

my_board.run

# Enter a command: mktodo cheese 2019-10-25 foooooood
# Enter a command: mktodo toothpaste 2019-10-23
# Enter a command: mktodo candy 2019-10-31 sugar-free
# Enter a command: mktodo shampoo 2019-10-25
# Enter a command: print
# ------------------------------------------
#                 GROCERIES
# ------------------------------------------
# Index | Item                 | Deadline
# ------------------------------------------
# 0     | cheese               | 2019-10-25
# 1     | toothpaste           | 2019-10-23
# 2     | candy                | 2019-10-31
# 3     | shampoo              | 2019-10-25
# ------------------------------------------

# Enter a command: sort

# Enter a command: print
# ------------------------------------------
#                 GROCERIES
# ------------------------------------------
# Index | Item                 | Deadline
# ------------------------------------------
# 0     | toothpaste           | 2019-10-23
# 1     | cheese               | 2019-10-25
# 2     | shampoo              | 2019-10-25
# 3     | candy                | 2019-10-31
# ------------------------------------------

# Enter a command: swap 0 3

# Enter a command: print
# ------------------------------------------
#                 GROCERIES
# ------------------------------------------
# Index | Item                 | Deadline
# ------------------------------------------
# 0     | candy                | 2019-10-31
# 1     | cheese               | 2019-10-25
# 2     | shampoo              | 2019-10-25
# 3     | toothpaste           | 2019-10-23
# ------------------------------------------

# Enter a command: print 1
# ------------------------------------------
# cheese                          2019-10-25
# foooooood
# ------------------------------------------

# Enter a command: priority
# ------------------------------------------
# candy                           2019-10-31
# sugar-free
# ------------------------------------------

# Enter a command: lower 0
# Sorry, that command is not recognized.
# Enter a command: down 0

# Enter a command: print
# ------------------------------------------
#                 GROCERIES
# ------------------------------------------
# Index | Item                 | Deadline
# ------------------------------------------
# 0     | cheese               | 2019-10-25
# 1     | candy                | 2019-10-31
# 2     | shampoo              | 2019-10-25
# 3     | toothpaste           | 2019-10-23
# ------------------------------------------

# Enter a command: up 3 2

# Enter a command: print
# ------------------------------------------
#                 GROCERIES
# ------------------------------------------
# Index | Item                 | Deadline
# ------------------------------------------
# 0     | cheese               | 2019-10-25
# 1     | toothpaste           | 2019-10-23
# 2     | candy                | 2019-10-31
# 3     | shampoo              | 2019-10-25
# ------------------------------------------

# Enter a command: printerino
# Sorry, that command is not recognized.