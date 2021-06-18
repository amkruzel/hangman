# module containing the logic for the game

module Logic
  def pick_word
    @cur_word = @@dict.sample
    @cur_guess_status = '_' * cur_word.length
    @guesses = []
  end

  def show_game
    puts @cur_guess_status
  end

  # check if guessed letter is in word and has not already been guessed
  # pushes guess to @guessed arr, modifies guess_state
  def check_guess?(guess, word, guess_state, guesses)
    if word.include?(guess) && !guesses.include(guess)
      word.split('').each_with_index do |letter, i| 
        guess_state[i] = letter == guess ? letter : '_'
      end

      @guesses.push(guess)
      @cur_guess_status = guess_state
      return true
    elsif guesses.include?(guess)
      repeat_guess(guess)
  end

  def game_state

  end
end