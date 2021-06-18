# module containing methods to ask for player input
module PlayerInput
  def new_or_load_game
    loop do
      puts "Must be '1' or '2'"
      input = gets.chomp.to_i
      break if [1, 2].include?(input)
    end
    @new_or_load = input
  end

  def guess
    loop do
      puts 'Must be an alphabetic character'
      input = gets.chomp.to_i
      break if /[[:alpha:]]/.match?(input) && input.length == 1
    end
    @cur_guess = input.downcase
  end
end
