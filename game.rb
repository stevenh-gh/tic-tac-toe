require_relative 'board'
require_relative 'player'

class Game
  attr_reader :board, :player_x, :player_y

  def initialize
    @board = Board.new

    print 'Enter player X name: '
    @player_x = Player.new(gets.chomp, 'X', board)

    print 'Enter player O name: '
    @player_y = Player.new(gets.chomp, 'O', board)
  end
end
