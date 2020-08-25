require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    # call on map to get node in LL (cache)

    # if node exists
      # return value that node stores
      # update node to be front of LL
    # if not
      # compute value, create node
      # update node to be front of LL
      # trim LL and MAP if needed
      if @store.include?(key)
        update_node!(@map[key])
      else
        calc!(key)
      end
      eject! if @map.count > @max
      @store.get(key)
    # if exceeded
      # trim
  end

  def to_s
    'Map: ' + @map.to_s + '\n' + 'Store: ' + @store.to_s
  end

  private

  def calc!(key)
    
    # suggested helper method; insert an (un-cached) key
    @store.append(key,@prc.call(key)) #whatever i just appended is the tail
    @map[key] = @store.last
  end

  def update_node!(node)
    # suggested helper method; move a node to the end of the list
    # L .... F
    # A B C D
    @store.remove(node.key)
    # A C D
    @store.append(node.key,node.val)
    # A C D B
    @map[node.key] = @store.last
  end

  def eject!
    @map.delete(@store.first.key)
    @store.remove(@store.first.key)
  end
end
