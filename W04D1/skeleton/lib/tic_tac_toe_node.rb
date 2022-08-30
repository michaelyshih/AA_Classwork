require_relative 'tic_tac_toe'
require "byebug"



class TicTacToeNode

  attr_reader :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end


  def losing_node?(evaluator) #evaluator is our mark

    if @board.over?
      return @board.won? && @board.winner != evaluator
    end

    if @next_mover_mark == evaluator

      return self.children.all? do |child|
        child.losing_node?(evaluator)
      end

    else

      return self.children.any? do |child|
        child.losing_node?(evaluator)
      end

    end
  end

  def winning_node?(evaluator)

  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    children_arr = []

    (0...3).each do |i|
      (0...3).each do |j|

        pos = [i,j]

        child_board = @board.dup
        child_mark = @next_mover_mark.dup

        child_mark == :x ? child_mark = :o : child_mark = :x

        # debugger
        if @board.empty?(pos)
          child_board[pos] = child_mark
          children_arr << TicTacToeNode.new(child_board, child_mark, pos)
        end
      end
    end

    children_arr
  end
end
