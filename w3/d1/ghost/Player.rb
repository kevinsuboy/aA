class Player

    attr_reader :name, :ghost

    def initialize(name)
        @name = name
        @ghost = []
    end


    def guess
        p "#{@name} guess: "
        gets.chomp
    end
end

if __FILE__ == $PROGRAM_NAME

end