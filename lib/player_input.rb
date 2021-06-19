# module containing methods to ask for player input
module PlayerInput
  def new_or_load_game
    input = gets.chomp
    until %w(1 2).include?(input)
      puts "Invalid input; must be '1' or '2'"
      input = gets.chomp
    end
    @new_or_load = input
  end

  def guess
    input = gets.chomp
    until /[[:alpha:]]/.match?(input) && input.length == 1
      puts 'Invalid input; must be an alphabetic character'
      input = gets.chomp
    end
    @cur_guess = input.downcase
  end

  def y_or_n
    input = gets.chomp.downcase
    until %w(y n).include?(input)
      puts "Invalid input; please type 'y' or 'n'"
      input = gets.chomp.downcase
    end
    input
  end

  def play_again?
    input = y_or_n
    exit if input == 'n'
    true
  end

  def save_game?
    input = y_or_n
    true if input == 'y'
  end

  def which_game_num(amt)
    input = gets.chomp.to_i
    until input.between?(1, amt) && input.is_a?(Integer)
      puts 'Invalid input; please type one of the numbers'
      input = gets.chomp.to_i
    end
    input
  end
end
