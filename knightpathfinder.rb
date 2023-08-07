require_relative 'polytreenode'
class KnightPathFinder
    def initialize(pos)
        @pos = pos
        @root_node = PolyTreeNode.new(pos)
        # @node = PolyTreeNode.new(pos)
    end

    def build_move_tree
        # @root_node.children << polytreenode.new()
    end
end