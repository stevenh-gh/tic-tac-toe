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

  private

  attr_reader :board
end

b = Board.new
b.print_board
