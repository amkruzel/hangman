# module containing prompts to the player
module Prompts
  def greeting
    outer_line = '-' * 40
    inner_text = 'HANGMAN'
    print 'Time to play'
    3.times do
      sleep(0.75)
      print '.'
    end; sleep(0.75)
    print "\n#{outer_line}\n|#{inner_text.center(38)}|\n#{outer_line}\n"
  end

  def game_rules
    puts 'You will be allowed six incorrect guesses'
  end
end