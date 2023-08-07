require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos unless prev_move_pos.nil?
  end

  def losing_node?(evaluator)
    return true if (!@board.winner || @board.winner != evaluator ) && @board.over?

    if evaluator == @board.next_mark
      self.children.all? { |child| child.losing_node?(@board.next_mark) }
    else
      self.children.any? { |child| child.losing_node?(@board.next_mark) }
    end
    
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    boards = []
    @board.rows.each.with_index do |row, row_idx|
      row.each.with_index do |col, col_idx|
        pos = [row_idx, col_idx]
        if @board.empty?(pos)
          new_board = @board.dup
          new_board[pos] = @next_mover_mark
          node = TicTacToeNode.new(new_board, new_board.next_mark , pos)
          boards << node
        end
      end
    end
    boards
  end

end