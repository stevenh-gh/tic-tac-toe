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
    @winner = nil
  end

  def game_start
    puts 'Enter coordinates like so: 12 (if you want the coordinates 1,2)'
    count = 0
    until is_game_over
      team = count.even? ? 'x' : 'o'
      play_game(team)
      if board.check_board(current_input)
        self.winner = [player_x, player_o].find { |player| player.symbol == team.upcase }
        self.is_game_over = true
        declare_winner
      end
      count += 1
      self.is_game_over = true if count == 9
    end
    puts 'This match is a tie!'
  end

  private

  attr_accessor :is_game_over, :current_input, :winner

  def declare_winner
    puts "#{winner.name} is the winner!"
  end

  def play_game(team)
    query_player(team)
    board.print_board
  end

  def convert_input(string_coord)
    string_coord.split('').map { |ele| ele.to_i }
  end

  def query_player(team)
    is_legal_move = false
    case team
    when 'x'
      until is_legal_move
        print 'Player X enter coordinates: '
        @current_input = convert_input(gets.chomp)
        is_legal_move = player_x.add_mark(current_input)
      end
    when 'o'
      until is_legal_move
        print 'Player O enter coordinates: '
        @current_input = convert_input(gets.chomp)
        is_legal_move = player_o.add_mark(current_input)
      end
    end
  end
end
