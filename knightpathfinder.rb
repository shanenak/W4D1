require_relative 'polytreenode'
class KnightPathFinder

    def self.valid_moves
        pairs = []
        nums = [1,-1,-2,2]
        (0...nums.length).each do |first|
            (0...nums.length).each do |second|
                if nums[first].abs + nums[second].abs == 3
                    pairs << [nums[first], nums[second]]
                end
            end
        end
        pairs
    end

    p KnightPathFinder.valid_moves


    def initialize(pos)
        @pos = pos
        @root_node = PolyTreeNode.new(pos)
        # @node = PolyTreeNode.new(pos)
    end

    # def build_move_tree
    #     # @root_node.children << polytreenode.new()
    # end

    def new_move_positions

    end
end