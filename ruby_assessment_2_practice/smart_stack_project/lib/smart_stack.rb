class SmartStack < Stack
    attr_reader :max_size
    def initialize(n)
        @max_size = n
        super()
    end
    def full?
        self.size >= @max_size
    end
    def push(*args)
        if args.length + self.size > @max_size
            raise "stack is full"
            return
        end
        args.each {|a| super(a)}
        @underlying_array.size
    end
    def pop(n=1)
        n.times.map{super()}
    end
end