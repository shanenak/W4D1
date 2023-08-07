require_relative 'polytreenode'
class KnightPathFinder

    def self.valid_moves(pos)
        pairs = []
        nums = [1,-1,-2,2]
        (0...nums.length).each do |first|
            (0...nums.length).each do |second|
                if nums[first].abs + nums[second].abs == 3
                    pairs << [pos[0]-nums[first], pos[1]-nums[second]]
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
        
    end

    def new_move_positions(pos)
        valid_moves = KnightPathFinder.valid_moves(pos)
        valid_moves.select do |move|
            !@considered_positions.include?(move)
        end
    end


    # n = KnightPathFinder.new([5,5])
    # p n.new_move_positions([5,5])
    # p KnightPathFinder.valid_moves([5,5])
end