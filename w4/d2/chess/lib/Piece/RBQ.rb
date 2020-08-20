require_relative "Piece.rb"
require_relative "modules/Slideable.rb"

class RBQ < Piece
    TYPE = {:R => '♜', :B => '♝', :Q => '♛'}
    include Slideable
    # attr_reader :symbol
    def initialize(type,color,board,pos)
        raise 'not a valid type' unless TYPE.has_key?(type)
        @symbol = TYPE[type] # :R :B or :Q
        super(color,board,pos)
    end
    # def to_s
    #     (self.symbol).colorize(self.color)
    # end

    # def symbol
    #     # p "#{self.color} #{self.type}" # check this
    #     # self.type.colorize(self.color)
    #     type
    # end
    protected
    def move_dirs
        case self.symbol
            when '♜'
                horizontal_dirs
            when '♝'
                diagonal_dirs
            else
                # debugger
                horizontal_dirs + diagonal_dirs
        end
    end
end

# module Test_module
#     private
#     def func
#         p "im in the module"
#     end
# end

# class Test < PARENT
#     include Test_module
#     def func0
#         # self.func
#         func
#     end
#     protected
#     def func
#         p "i'm in the Test"
#     end
# end

if __FILE__ == $PROGRAM_NAME
    # t = Test.new
    # t.func0
end

