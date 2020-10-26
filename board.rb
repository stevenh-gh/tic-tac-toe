class Board
  def initialize
    @board = Array.new(3) { Array.new(3, ' ') }
  end

  def print_board
    board.each do |array|
      array.each do |ele|
        print "|#{ele}"
      end
      puts '|'
    end
  end

  def set_mark(symbol, coord)
    x = coord[0]
    y = coord[1]
    if board[x][y] == ' '
      board[x][y] = symbol
    else
      puts 'Illegal move!'
    end
  end

  private

  attr_reader :board
end
