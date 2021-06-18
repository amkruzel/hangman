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
    puts "\tYou will be allowed six incorrect guesses"
  end

  def prompt_new_or_load_game
    puts 'Do you want to start a new game or load a saved game?'
    puts "'1' for new game"
    puts "'2' for saved game"
  end

  def player_guess
    puts 'What is your guess?'
  end

  def correct_guess
    puts 'Great! The word includes that letter.'
  end

  def repeat_guess(guess)
    puts "You have already guessed '#{guess}'. Please guess again."
  end

  def incorrect_guess
    puts 'Incorrect guess!'
  end
end
