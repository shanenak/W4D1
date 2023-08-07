class PolyTreeNode
    attr_reader :parent, :children, :value

    def initialize(position, parent=nil)
        @parent = parent
        @position = position # instance
        @children = [] # array of instances
        @board = Array.new(8) { Array.new(8) }
        # @root_node = root_node
    end

    def parent=(new_parent) # nil or an instance
        @parent.children.delete(self) if @parent != nil && @parent.children.include?(self)  
        @parent = new_parent
        if new_parent == nil   
            return nil
        elsif !new_parent.children.include?(self)
            new_parent.children << self
        end
    end

    def add_child(child)
        child.parent = self
        # @children << child
    end

    def [](pos)
        x, y = pos
        @board[x][y]
    end

    # def []=(position)
    #     x, y = positon
    # end

    def is_valid?(pos)
        x, y = pos
        return false if (x > 8 || y > 8) && (x < 0 || y < 0)
        return true
     end
    def add_possible_children
        x, y = @position
    end

    def remove_child(child)
        raise "Node is not a child" unless self.children.include?(child)
        child.parent = nil
    end

    def inspect
        return "<# Value: #{@value} Parent: #{@parent} Children: #{@children} "
    end

    # def dfs(target)
    #     tree = self.dup
    #     stack = self
    #     self = self.children
    #     while stack.length > 0 
    #         if stack[-1] == target
    #             return self
    #         elsif stack[-1] != target
    #             stack.pop
    #             stack << stack[-1].children
    #         end
    #     end
    # end

    def dfs(target)
        return self if self.value == target
        return nil if self.children.empty?
        # nodes = self
        self.children.each do |node| 
            result = node.dfs(target)
            return result unless result.nil?
        end
        nil
    end

    def bfs(target)
        queue = [self]
        while queue.length > 0
            if queue[0].value == target
                return queue[0]
            else
                queue += queue[0].children # we only had to switch these two lines!! line 75 and 76
                queue.shift
            end
            # end
        end

        return  nil
    end
    
end