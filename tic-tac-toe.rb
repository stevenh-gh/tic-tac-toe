require_relative 'game'

def tic_tac_toe
  game = Game.new
  game.game_start
end

def play_ttt
  stop = false
  until stop
    tic_tac_toe
    good_input = false
    input = nil
    until good_input
      print 'Restart game? (Y/N)'
      input = gets.chomp
      good_input = true if input.downcase == 'y' || input.downcase == 'n'
    end
    stop = true if input == 'n'
  end
end

play_ttt
