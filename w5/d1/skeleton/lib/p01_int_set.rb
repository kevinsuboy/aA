require 'byebug'

class MaxIntSet
  attr_reader :store
  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
    raise "Out of bounds" if num < 0 || num >= @store.length

    store[num] = true
  end

  def remove(num)
    store[num] = false
  end

  def include?(num)
      store[num]
  end

end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num if !self.include?(num)
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private
  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet < IntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    super(num_buckets)
    @count = 0
  end

  def insert(num)
    super(num) 
    @count = @store.sum{|sub| sub.length}

    resize! if count == num_buckets#if we're full
  end

  def remove(num)
    super(num)
    @count = @store.sum{|sub| sub.length}
  end


  private
  def num_buckets
    @store.length
  end

  def resize!
    old_store = @store
    @store = Array.new(num_buckets*2) { Array.new }
    old_store.each {|s| s.each {|el|  self.insert(el)}  }
  end
end
