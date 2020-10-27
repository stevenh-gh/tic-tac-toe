require_relative 'board'
require_relative 'player'

class Game
  attr_reader :board, :player_x, :player_o

  def initialize
    @board = Board.new

    print 'Enter player X name: '
    @player_x = Player.new(gets.chomp, 'X', board)

    print 'Enter player O name: '
    @player_o = Player.new(gets.chomp, 'O', board)

    @is_game_over = false
  end

  def game_start
    puts 'Enter coordinates like so: 12 (if you want the coordinates 1,2)'
    until is_game_over
      query_player('x')
      board.print_board
      query_player('o')
      board.print_board

      is_game_over = true
    end
  end

  private

  attr_accessor :is_game_over

  def convert_input(string_coord)
    string_coord.split('').map { |ele| ele.to_i } if string_coord.length == 2
  end

  def query_player(team)
    case team
    when 'x'
      print 'Player X enter coordinates: '
      player_x.add_mark(convert_input(gets.chomp))
    when 'o'
      print 'Player O enter coordinates: '
      player_o.add_mark(convert_input(gets.chomp))
    end
  end
end

g = Game.new
g.game_start
