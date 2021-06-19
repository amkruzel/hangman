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

  def end_game
    puts 'You got it!' if @cur_guess_status == @cur_word
    if @guesses_remaining.zero?
      puts 'You lost :('
      puts "The word was '#{@cur_word}'"
    end
    puts 'Do you want to play again? (y/n)'
  end

  def prompt_save_game
    puts "Would you like to save your game? 'n' to continue playing (y/n)"
  end

  def prompt_save_game_name
    puts 'Please type a short name/signature to remember this game. You will also be able to see the game state when reloading'
    gets.chomp
  end
end
