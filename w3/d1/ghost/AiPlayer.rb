class AiPlayer

    attr_reader :name, :ghost

    def initialize(name)
        @name = name
        @ghost = []
    end


    def guess
        p "#{@name} guess: "
        ("a".."z").to_a.sample
    end
end

if __FILE__ == $PROGRAM_NAME

end