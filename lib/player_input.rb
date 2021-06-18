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
end
