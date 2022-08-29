require_relative "00_tree_node"
require "byebug"
class KnightPathFinder

    attr_accessor :root, :pos

    def self.root_node(pos)
        PolyTreeNode.new(pos)
    end

    def initialize(pos)
        @start_pos = pos
        @root = KnightPathFinder.root_node(@start_pos)
        @considered_pos = [] #if you've moved into that pos already put it inside @considered pos
    end

    # def build_move_tree
    #     KnightPathFinder.root_node


    # end


    def self.valid_moves(pos) # return all possible positions node can make from this pos
        x, y = pos
        movements = [
            [1,2],
            [1,-2],
            [2,1],
            [-2,1],
            [-1,2],
            [-1,-2],
            [-2,1],
            [-2,-1]
        ]
        all_p = movements.map {|arr| arr = [arr[0] + x ,arr[1] + y]}
        all_p
    end

    def new_move_positions(pos)
        # call valid moves to find all moves
        # filter out onces tha are already in considered_pos
        # put every pos you've considered/ selected into considered_pos

        all_pos = KnightPathFinder.valid_moves(pos)
        sel_p = all_pos.select {|npos| !@considered_pos.include?(npos) && (0..7).include?(npos[0]) && (0..7).include?(npos[1])}
        @considered_pos += sel_p
        sel_p
    end

    def build_move_tree #make entire board
        #after traverse / add new_mov_positions into considered
        #find shortest path through BFS
        #use queue to process nodes in FIFO
        #root_node is start_pos and check it's new_move_positions (also store the them in considered)
        #check all of the new_move_position
        #BFS the next node into queue and repeat until queue is empty

        queue = []

        queue << @root  #add the node into queue
        while !queue.empty?
            # debugger
            curr_node = queue[0]      # currently have root_pos in 0 iteration
            new_move_positions(curr_node.value).each do |child_pos| #positions of possible moves root can make
                #should i make node before or after adding it in queue?
                #put the new_move_position possible moves into queue
                child_node = PolyTreeNode.new(child_pos)
                curr_node.add_child(child_node)
                queue << child_node
            end
            queue.shift
        end

    end

    def find_path(end_pos)
        #dfs to find node with the given end position
        result_node = self.root.dfs(end_pos)

        trace_path_back(result_node)
    end

    def trace_path_back(node)
        # nodes = []
        return [node.value] if node.parent.nil?
        # nodes.unshift()
        trace_path_back(node.parent) + [node.value]

    end



end




p a = KnightPathFinder.new([0,0])
p a.build_move_tree

p a.find_path([7,7])
