require 'byebug'

require_relative 'p04_linked_list'

class HashMap
  attr_accessor :count

  include Enumerable

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    bucket(key).include?(key)
  end

  def set(key, val)
    if bucket(key).include?(key)
      bucket(key).update(key,val)
    else
      bucket(key).append(key,val) # appending creates a NODE
      self.count += 1
      # debugger if self.count == 6
      resize! if self.count == num_buckets #if we're full    
    end
  end

  def get(key)
    @store[key.hash % num_buckets].get(key)
    # @store[] -> LL
      # LL.get
  end

  def delete(key)
    bucket(key).remove(key)
    self.count -= 1
  end

  def each(&prc)
     @store.each {|ll| ll.each{|node| prc.call(node.key, node.val )} }
    #@store.each {|ll| ll.each(&prc)} # this one
  end

  # uncomment when you have Enumerable included
  # def to_s
  #   pairs = inject([]) do |strs, (k, v)|
  #     strs << "#{k.to_s} => #{v.to_s}"
  #   end
  #   "{\n" + pairs.join(",\n") + "\n}"
  # end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    # debugger
    old_store = @store
    @store = Array.new(num_buckets*2) { LinkedList.new }
    self.count = 0
    old_store.each {|ll| ll.each {|node| self.set(node.key,node.val)}  } # each set is stil ++count
  end

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
    @store[key.hash % num_buckets]
  end
end
