
require './file_logic'
require './prompts'
require './game_logic'
require './player_input'

class Game
  include Prompts
  include LoadFiles
  include Logic
  include PlayerInput

  attr_reader :new_or_load, :dict

  def initialize
    greeting
    # from Prompts
    prompt_new_or_load_game

    # from PlayerInput
    new_or_load_game # assigns @new_or_load (1 - new, 2 - load)

    # load_saves
  end

  def new_game
    load_dict
    game_init # inits @guesses_arr and @guesses_remaining
    pick_word # defines @cur_word and @cur_guess_status
    game_rules
  end

  def play_round
    show_game(@guesses_remaining, @guesses)
    player_guess
    guess # assigns @cur_guess

    until check_guess?(@cur_guess, @cur_word, @cur_guess_status, @guesses)
      @cur_guess.clear
      guess
    end
    save_and_quit
  end

  def game_over?
    @cur_guess_status == @cur_word || @guesses_remaining.zero?
  end

  def load_game

  end
end

game = Game.new

# Game loop
loop do
  # New game
  if game.new_or_load == '1'
    loop do
      game.new_game
      loop do
        game.play_round
        game.prompt_save_game
        game.save_and_quit if game.save_game?
        break if game.game_over?
      end

      game.prompt_new_or_load_game
      game.new_or_load_game
      break if game.new_or_load == '2'
    end
  end

  # Load game
  if game.new_or_load == '2'
    loop do
    end
  end
end
