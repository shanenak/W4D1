require_relative 'tic_tac_toe_node'

class SuperComputerPlayer < ComputerPlayer
  def move(game, mark)
    node = TicTacToeNode.new(game.board, mark)
    node.children.each do |child|
      if child.winning_node?(mark)
        return child.prev_move_pos 
      elsif !child.losing_node(mark)
        nonlosing_nodes = node.children.select {|child| !child.losing_node?(mark)}
        return nonlosing_nodes.sample.prev_move_pos
      else 
        raise 'No non-losing nodes' if nonlosing_nodes.empty?
        # return nonlosing_nodes.first.prev_move_pos
      end
    end
  end
end

if $PROGRAM_NAME == __FILE__
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end