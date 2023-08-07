class KnightPathFinder
    def initialize(pos)
        @board = Array.new(8) {Array.new(8)}
        @pos = pos
        @node = PolyTreeNode.new(pos)
    end
end