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
    if (coord.length != 2) ||
       (coord[0] < 0 || coord[0] > 2) ||
       (coord[1] < 0 || coord[1] > 2)
      return error
    end

    x = coord[0]
    y = coord[1]
    if board[x][y] == ' '
      board[x][y] = symbol
      true
    else
      error
    end
  end

  def check_board(coord); end

  private

  attr_reader :board

  def error
    puts 'Illegal move! Try again'
    false
  end
end
