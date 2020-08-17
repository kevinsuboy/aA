class PolyTreeNode
    attr_reader  :value
    attr_accessor :children, :parent
    def initialize(value)
        @parent = nil
        @children = []
        @value = value
    end
    def parent=(parent_node)
        @parent.children.delete(self) if @parent
        @parent = parent_node
        if parent_node
            parent_node.children << self unless parent_node.children.include?(self)
        end
    end
    # node1.parent = PARENT
    # PARENT.child = node1

    def add_child(child_node)
        child_node.parent =  self
        @children << child_node unless @children.include?(child_node)
    end

    def remove_child(child_node)
        child_node.parent = nil
        raise 'error' unless @children.include?(child_node)
        @children.delete(child_node)
    end

    def dfs(target_value)
        return self if self.value == target_value
        children.each do |child| 
            result = child.dfs(target_value) 
            return result if result
        end
        return nil
    end
    def bfs(target_value)
        q = [] # queue<int>
        # first ..... last
        q.push(self)
        while !q.empty?
            node = q.shift()
            return node if node.value==target_value
            node.children.each {|child| q<<child}
        end
        return nil
    end
    def inspect
        print
    end
    def print
        q = [] # queue<int>
        q.push(self)
        # debugger
        while !q.empty?
            size = q.length
            res = []
            while size > 0
                node = q.shift()
                res << node.value
                node.children.each {|child| q<<child}
                size-=1
            end
            p "#{res}".ljust(5," ")
        end
        return nil
    end
end