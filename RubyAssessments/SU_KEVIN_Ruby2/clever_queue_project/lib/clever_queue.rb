class CleverQueue < SimpleQueue
    attr_reader :capacity
    attr_accessor :soft_limit
    def initialize(n1,n2)
        @capacity, @soft_limit =n1,n2
        raise 'invalid args' if @soft_limit > @capacity
        super()
    end
    def enqueue(*items)
        if items.length + self.size > self.capacity
            raise 'queue is full'
            return
        end
        items.each {|item| super(item)}
        self.size
    end
    def dequeue(n=1)
        n.times.map{|i| super()}
    end
    def trim
        return false unless(self.size > @soft_limit)
        while self.size>@soft_limit
            @hidden_array.pop()
        end
        return true
    end
end