require_relative 'board'

class Player
  attr_reader :name
  def initialize(name, symbol, board)
    @name = name
    @symbol = symbol
    @board = board
  end

  def add_mark(_coord)
    board.set_mark(symbol, _coord)
  end

  private

  attr_reader :symbol, :board
end
