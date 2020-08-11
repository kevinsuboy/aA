require_relative 'item.rb'

# p Item.valid_date?('2019-10-25') # true
# p Item.valid_date?('1912-06-23') # true
# p Item.valid_date?('2018-13-20') # false
# p Item.valid_date?('2018-12-32') # false
# p Item.valid_date?('10-25-2019') # false

# Item.new('Fix login page', '2019-10-25', 'The page loads too slow.')

# Item.new(
#     'Buy Cheese',
#     '2019-10-21',
#     'We require American, Swiss, Feta, and Mozzarella cheese for the Happy hour!'
# )

# Item.new(
#     'Fix checkout page',
#     '10-25-2019',
#     'The font is too small.'
# ) # raises error due to invalid date


# --------------------------------------------------------------------

load 'item.rb'
    # => true

# my_item = Item.new('Fix login page', '2019-10-42', 'It loads slow.')
    # RuntimeError: deadline is not valid

p my_item = Item.new('Fix login page', '2019-10-22', 'It loads slow.')
    # => #<Item:0x
    #         @deadline="2019-10-22",
    #         @description="It loads slow.",
    #         @title="Fix login page">

p my_item.title
    # => "Fix login page"

p my_item.description = 'It loads waaaaaay too slow!'
    # => "It loads waaaaaay too slow!"

p my_item
    # => #<Item:0x
    #         @deadline="2019-10-22",
    #         @description="It loads waaaaaay too slow!",
    #         @title="Fix login page">

p my_item.deadline = "10-23-2019"
    # RuntimeError: deadline is not valid

p my_item.deadline
    # => "2019-10-22"

p my_item.deadline = "2019-10-23"
    # => "2019-10-23"

    p my_item.deadline
    # => "2019-10-23"

    p my_item
    # => #<Item:0x
    #     @deadline="2019-10-23",
    #     @description="It loads waaaaaay too slow!",
    #      @title="Fix login page">
    # As you work through the rest of this project, be sure to test your code often and not just when we tell you to!
