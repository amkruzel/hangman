# module containing the logic for the game

module Logic
  def pick_word
    @cur_word = @dict.sample
    @cur_guess_status = '_' * @cur_word.length
  end

  def game_init
    @guesses = []
    @guesses_remaining = 6
  end

  def show_game(num, arr)
    puts "\tYou have #{num} guesses remaining"
    puts "\tYour previous guesses are: #{arr}"
    puts "\tWord: #{@cur_guess_status} (#{@cur_word.length} letters long)\n\n"
  end

  # check if guessed letter is in word and has not already been guessed
  # pushes guess to @guessed arr, modifies guess_state
  def check_guess?(guess, word, guess_state, guesses)
    if guesses.include?(guess) # letter has already been guessed
      repeat_guess(guess)
      return false

    elsif word.include?(guess) # correct guess
      word.split('').each_with_index do |letter, i|
        guess_state[i] = letter == guess ? letter : guess_state[i]
      end

      correct_guess
      @guesses.push(guess)
      @cur_guess_status = guess_state

    else # incorrect guess
      incorrect_guess
      @guesses.push(guess)
      @guesses_remaining -= 1
    end
    true
  end

  def advance_game
  end

  def game_state

  end
end