require_relative 'polytreenode'
class KnightPathFinder

    def self.valid_moves(pos)
        pairs = []
        nums = [1,-1,-2,2]
        (0...nums.length).each do |first|
            (0...nums.length).each do |second|
                if nums[first].abs + nums[second].abs == 3
                    x = pos[0]-nums[first]
                    y = pos[1]-nums[second]
                    pairs << [x,y] if (x < 8 && y < 8) && (x > 0 && y > 0)
                end
            end
        end
        pairs
    end

    def initialize(pos)
        @pos = pos
        @root_node = PolyTreeNode.new(pos)
        @considered_positions = [@pos]
    end

    def build_move_tree
        queue = [@root_node] #
        until queue.empty?
            current_node = queue.first
            valid_moves = new_move_positions(current_node.value)
            valid_moves.each do |move|
                child = PolyTreeNode.new(move)
                current_node.add_child(child)
                queue << child
                #add valid moves to the queue and shift first element from queue
            end
            queue.shift
        end
        @root_node
    end

    def new_move_positions(pos)
        valid_moves = KnightPathFinder.valid_moves(pos)
        filtered_moves = valid_moves.select do |move|
            !@considered_positions.include?(move)
        end
        @considered_positions += filtered_moves
        filtered_moves
    end


    n = KnightPathFinder.new([5,5])
    p KnightPathFinder.valid_moves([5,5])
    p n.build_move_tree
end