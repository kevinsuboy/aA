class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil   
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable

  def initialize
    @head = Node.new
    @tail = Node.new
    head.next = tail
    tail.prev = head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    head.next 
   
  end

  def last
    tail.prev
  end

  def empty?
    @head.next == @tail #sentinel
  end

  def get(key)
    self.each{|node| return node.val if node.key == key}
  end

  def include?(key)
    self.any?{|node| node.key == key}
  end

  def append(key, val)
    # H[k,v] n[k,v] n[k,v] n[k,v] n[k,v] T[k,v]
    # H T
    # H n T
    # H <-> n <-> T
    
    node = last
    new_node = Node.new(key, val)
    if node
      node.next = new_node
      new_node.prev = node
    else
      head.next = new_node
      new_node.prev = head
    end
    new_node.next = tail
    tail.prev = new_node
  end

  def update(key, val)
    self.each{|node| node.val = val if node.key == key}
  end

  def remove(key)
    left = head
    left = left.next until left.next.key == key
    
    node = left.next
    right = node.next
    left.next = right
    right.prev = left
  end

  def each(&prc)
    node = first
    while node != tail
      prc.call(node)
      node = node.next
    end
  end

  private
  attr_accessor :head, :tail

end
