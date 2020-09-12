class SimpleQueue

    def initialize
        @hidden_array = []
    end
    def size
        @hidden_array.size
    end
    def vacant?
        @hidden_array.size == 0
    end
    def front
        @hidden_array[0]
    end
    def back
        @hidden_array[-1]
    end
    def first(n)
        @hidden_array[0...n]
    end
    def last(n)
        @hidden_array[-n..-1]
    end
    def enqueue(item)
        @hidden_array.push(item)
        self.size
    end
    def dequeue
        @hidden_array.shift
    end
end