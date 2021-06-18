
require './file_logic'
require './prompts'
require './game_logic'
require './player_input'

class Game
  include Prompts
  include LoadFiles
  include Logic
  include PlayerInput

  attr_reader = :new_or_load

  def initialize
    greeting
    # from Prompts
    prompt_new_or_load_game

    # from PlayerInput
    new_or_load_game # assigns @new_or_load (1 - new, 2 - load)
  end

  def new_game
    pick_word # defines @cur_word and @cur_guess_status; creates empty @guesses array
    game_rules
  end

  def play_round
    show_game
    player_guess
    guess # assigns @cur_guess

    check_guess?(@cur_guess, @cur_word, @cur_guess_status, @guesses)
  end

  def load_game

  end
end

game = Game.new
