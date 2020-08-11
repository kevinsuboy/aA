load 'list.rb'
# => true
l = List.new('Groceries')
# => #<List:0x @items=[], @label="Groceries">
l.add_item('cheese', '2019-10-25')
# => true
l.add_item('toothpaste', '2019-10-25')
# => true
l.add_item('shampoo', '2019-10-24')
# => true
l.add_item('candy', '2019-10-31')
# => true
l.print
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
# => nil
l.sort_by_date!
# => [#<Item:0x @deadline="2019-10-24", @description="", @title="shampoo">,
#  #<Item:0x @deadline="2019-10-25", @description="", @title="cheese">,
#  #<Item:0x @deadline="2019-10-25", @description="", @title="toothpaste">,
#  #<Item:0x @deadline="2019-10-31", @description="", @title="candy">]
l.print
# ------------------------------------------
#                 GROCERIES
# ------------------------------------------
# Index | Item                 | Deadline
# ------------------------------------------
# 0     | shampoo              | 2019-10-24
# 1     | cheese               | 2019-10-25
# 2     | toothpaste           | 2019-10-25
# 3     | candy                | 2019-10-31
# ------------------------------------------
# => nil