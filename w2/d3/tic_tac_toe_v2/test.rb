load 'board.rb'
b = Board.new #<Board:0x @grid=[["_", "_", "_"], ["_", "_", "_"], ["_", "_", "_"]]>

# b.place_mark([-1, 2], :X) # this should fail
# RuntimeError: invalid mark
# from board.rb:28:in `place_mark'

b.place_mark([1, 2], :X) # :X

b
# => #<Board:0x @grid=[["_", "_", "_"], ["_", "_", :X], ["_", "_", "_"]]>

# b.place_mark([1, 3], :X) # this should fail
# RuntimeError: invalid mark
# from board.rb:28:in `place_mark'

b.place_mark([0, 0], :O)
# => :O

b
# => #<Board:0x @grid=[[:O, "_", "_"], ["_", "_", :X], ["_", "_", "_"]]>

# b.place_mark([0, 0], :X) # this should fail
# RuntimeError: invalid mark
# from board.rb:28:in `place_mark'
