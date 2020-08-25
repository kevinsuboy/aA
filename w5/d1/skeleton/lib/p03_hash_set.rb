class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    self[key] << key if !self.include?(key)
    @count = @store.sum{|sub| sub.length}
    resize! if count == num_buckets #if we're full
  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    self[key].delete(key)
    @count = @store.sum{|sub| sub.length}
  end

  private

  def [](num)
    @store[num.hash % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    old_store = @store
    @store = Array.new(num_buckets*2) { Array.new }
    old_store.each {|s| s.each {|el|  self.insert(el)}  }

  end
end
