require "byebug"
class PolyTreeNode

    attr_reader :parent, :children, :value

    def initialize(value)
        @parent = nil
        @children = Array.new()
        @value = value
    end

    def parent=(parent_node) #

        if parent == nil
            if parent_node == nil
                @parent = nil
            else
                @parent = parent_node
                parent_node.children << self
            end
        else
            if parent_node == nil
                self.parent.children.delete(self)
                @parent = nil
            else
                self.parent.children.delete(self)
                parent_node.children << self
                @parent = parent_node
            end
        end
    end

    def inspect
        @value.inspect
    end

    def add_child(child_node)
        # debugger
        if !@children.include?(child_node)
            child_node.parent = self
        end


    end

    def remove_child(child_node)

        if @children.include?(child_node)
            child_node.parent = nil
        else
            raise "this is not my child"
        end
    end

    def dfs(target_value)
        return self if self.value == target_value
        return nil if self.children == []
        @children.each do |child|
            found = child.dfs(target_value)
            if found != nil
                return found
            end
        end
        return nil
    end

    def bfs(target_value)

        queue = [self]
        while !queue.empty?
            return queue[0] if queue[0].value == target_value
            if !queue[0].children.empty?
                queue += queue[0].children
            end
            queue.shift
        end
        nil
    end

end

# class Queue

#     def initialize
#         @line = []
#     end

#     def enqueue

#     end
# end

# class
